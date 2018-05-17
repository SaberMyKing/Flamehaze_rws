class BangumiTag < ActiveRecord::Base

  belongs_to  :bangumi
  belongs_to  :tag

  class << self

    def create_new params
      Util.try_rescue do |response|

      end
    end

  end

end