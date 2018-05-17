class Tag < ActiveRecord::Base

  validates_presence_of :description,     strict: CommonException.new(ErrorCode::ERR_TAG_DESCRIPTION_INVALID)

  has_many  :bangumi_tags

  class << self

    def create_new params
      Util.try_rescue do |response|

      end
    end

  end


end