class Comment < ActiveRecord::Base
	#t.string   "user_id"
    #t.string   "item_id"
    #t.text     "body"
    #t.integer  "rating"
    #t.datetime "created_at"
    #t.datetime "updated_at"
    #t.string   "comment_type"
    
    validates_presence_of :rating, :body
end
