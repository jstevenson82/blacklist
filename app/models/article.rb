class Article < ActiveRecord::Base
	#t.string   "title"
    #t.text     "description"
    #t.string   "link"
    #t.string   "user_id"
    #t.datetime "created_at"
    #t.datetime "updated_at"
    
    validates_presence_of :title, :description, :link, :user_id
  	validates_uniqueness_of :title, :description, :link
end
