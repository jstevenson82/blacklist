class Coupon < ActiveRecord::Base
  #standard validations will go here
  validates_presence_of :headline, :body, :expire, :exclusion, :user_id, :b_id
end
