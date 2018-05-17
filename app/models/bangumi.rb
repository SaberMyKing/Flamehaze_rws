class Bangumi < ActiveRecord::Base

  validates_presence_of :name,          strict: CommonException.new(ErrorCode::ERR_BANGUMI_NAME_INVALID)
  validates_presence_of :episode_num,   strict: CommonException.new(ErrorCode::ERR_BANGUMI_EPISODE_NUM_INVALID)
  validates_presence_of :like_times,    strict: CommonException.new(ErrorCode::ERR_BANGUMI_LIKE_TIMES_INVALID)
  validates_presence_of :dislike_times, strict: CommonException.new(ErrorCode::ERR_BANGUMI_DISLIKE_TIMES_INVALID)

  validates_uniqueness_of  :name,       strict: CommonException.new(ErrorCode::ERR_BANGUMI_NAME_ALREADY_EXIST)

  belongs_to  :creator,    class_name: 'User', foreign_key: :creator_id

  has_many  :bangumi_subscriptions
  has_many  :bangumi_tags
  has_many  :bangumi_topics

  class << self

    def create_new params
      Util.try_rescue do |response|
        User.find_by! id: params['creator_id'], enabled: true
        params['like_times'] = 0
        params['dislike_times'] = 0
        params['enabled'] = true
        bangumi = create!(params.slice *(column_names - %w[id created_at updated_at]))
        response['id'] = bangumi.id
      end
    end

    def soft_delete params
      Util.try_rescue do |response|
        bangumi = find_by! id: params['id'], creator_id: params['creator_id'], enabled: true
        bangumi.update! enabled: false
      end
    end

  end

end