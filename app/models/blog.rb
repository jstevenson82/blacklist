class Blog < ActiveRecord::Base
	#t.string   "title"
    #t.text     "body"
    #t.string   "user_id"
    #t.datetime "created_at"
    #t.datetime "updated_at"
    
    validates_presence_of :title, :body
  	validates_uniqueness_of :title, :body
end
