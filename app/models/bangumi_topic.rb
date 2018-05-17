class BangumiTopic < ActiveRecord::Base
  validates_presence_of :title,         strict: CommonException.new(ErrorCode::ERR_BANGUMI_TOPIC_TITLE_INVALID)
  validates_presence_of :description,   strict: CommonException.new(ErrorCode::ERR_BANGUMI_TOPIC_DESCRIPTION_INVALID)
  validates_presence_of :read_times,    strict: CommonException.new(ErrorCode::ERR_BANGUMI_TOPIC_READ_TIMES_INVALID)

  belongs_to  :bangumi
  belongs_to  :creator,    class_name: 'User', foreign_key: :creator_id

  has_many  :bangumi_topic_comments

  class << self

    def create_new params
      Util.try_rescue do |response|

      end
    end

    def self.soft_delete params
      Util.try_rescue do |response|

      end
    end

  end

end