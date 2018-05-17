class BangumiSubscription < ActiveRecord::Base

  belongs_to  :bangumi
  belongs_to  :user

end