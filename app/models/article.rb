class Article < ActiveRecord::Base

  validates_presence_of :content,     strict: CommonException.new(ErrorCode::ERR_ARTICLE_CONTENT_INVALID)
  validates_presence_of :read_times,  strict: CommonException.new(ErrorCode::ERR_ARTICLE_READ_TIMES_INVALID)

  belongs_to  :user,    class_name: 'User', foreign_key: :creator_id
  has_many    :article_comments

  class << self

    # params['content']是包含html标签的文章内容，html标签标记了文章中的多种不同的字体格式
    def create_new params
      Util.try_rescue do |response|
        User.find_by! id: params['creator_id'], enabled: true
        params['enabled'] = true
        params['read_times'] = 0
        article = new(params.slice *(column_names - %w[id created_at updated_at]))
        content_htmltags = article.content
        article.content_remove_htmltags
        article.save!
        article.content = content_htmltags
        article.generate_content_htmlfile
        response['id'] = article.id
      end
    end

    def soft_delete params
      Util.try_rescue do |response|
        article = find_by! id: params['id'], creator_id: params['creator_id'], enabled: true
        article.update! enabled: false

        begin


        ensure

        end

      end
    end

  end

  # 将content原封不动的提出，并转换成一个html文件保存在指定路径
  def generate_content_htmlfile
    file = File.new(htmlfile_name, 'w')
    file.puts(content)
  end

  def htmlfile_name
    "#{id}_#{title}.html"
  end

  # 移除content中的html标签，并覆盖原有content
  def content_remove_htmltags
    self.content = method_name.strip_tags(content).squish
  end

  def method_name
    @helper ||= Class.new do
      include ActionView::Helpers::SanitizeHelper
    end.new
  end

end