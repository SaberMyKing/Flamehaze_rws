class User < ActiveRecord::Base
  validates_presence_of :name,  strict: CommonException.new(ErrorCode::ERR_USER_NAME_INVALID)
  validates_presence_of :uid,   strict: CommonException.new(ErrorCode::ERR_USER_UID_INVALID)
  validates_presence_of :level, strict: CommonException.new(ErrorCode::ERR_USER_LEVEL_INVALID)

  @@uid_counter = 0

  has_many :articles,          class_name: 'Article',        foreign_key: :creator_id
  has_many :articles_comments, class_name: 'ArticleComment', foreign_key: :creator_id

  class << self

    def create_new params
      Util.try_rescue do |response|
        user_exist = find_by name: params['name'], enabled: true
        return CommonException.new(ErrorCode::ERR_USER_ALREADY_EXIST).result if user_exist.present?
        params['level'] ||= 0
        params['enabled'] = true
        params['uid'] = uid_generate
        user = create!(params.slice *(column_names - %w[id created_at updated_at]))
        response['id'] = user.id
      end
    end

    def soft_delete params
      Util.try_rescue do |response|
        user = find_by! id: params['id'], uid: params['uid'], enabled: true
        user.update! enabled: false
      end
    end

  end

  class << self
    private

    def uid_generate
      @@uid_counter += 1
      Time.new.strftime('%Y') + format('%06d', @@uid_counter)
    end
  end


end