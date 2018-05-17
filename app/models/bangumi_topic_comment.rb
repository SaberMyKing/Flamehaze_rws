class BangumiTopicComment < ActiveRecord::Base

  validates_presence_of :like_times,    strict: CommonException.new(ErrorCode::ERR_BANGUMI_TOPIC_COMMENT_LIKE_TIMES_INVALID)
  validates_presence_of :dislike_times, strict: CommonException.new(ErrorCode::ERR_BANGUMI_TOPIC_COMMENT_DISLIKE_TIMES_INVALID)

  belongs_to  :creator,    class_name: 'User', foreign_key: :creator_id
  belongs_to  :bangumi_topic

  class << self

    def create_new params
      Util.try_rescue do |response|

      end
    end

    def soft_delete params
      Util.try_rescue do |response|

      end
    end

  end

end