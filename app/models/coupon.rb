class Coupon < ActiveRecord::Base

   #t.string   "b_id"
   #t.string   "headline"
   #t.text     "body"
   #t.date     "expire"
   #t.string   "exclusion"
   #t.string   "user_id"
   #t.datetime "created_at", :null => false
   #t.datetime "updated_at", :null => false
   
  #standard validations will go here
  validates_presence_of :headline, :body, :expire, :exclusion, :user_id, :b_id
end
