class ArticleComment < ActiveRecord::Base

  validates_presence_of :content, strict: CommonException.new(ErrorCode::ERR_ARTICLE_COMMENT_CONTENT_INVALID)

  belongs_to :article
  belongs_to :user,             class_name: 'User',        foreign_key: :creator_id
  has_many   :son_comments,     class_name: 'ArticleComment', foreign_key: :parent_comment_id

  class << self

    def create_new params
      Util.try_rescue do |response|
        User.find_by! id: params['creator_id'], enabled: true
        Article.find_by! id: params['article_id'], enabled: true
        params['enabled'] = true
        article_comment = create!(params.slice *(column_names - %w[id created_at updated_at]))
        response['id'] = article_comment.id
      end
    end

    def soft_delete params
      Util.try_rescue do |response|
        article_comment = find_by! id: params['id'], article_id: params['article_id'], enabled: true
        article_comment.update! enabled: false
      end
    end

  end

end