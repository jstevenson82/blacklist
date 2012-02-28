class Blog < ActiveRecord::Base
	#t.string   "title"
    #t.text     "body"
    #t.string   "user_id"
    #t.datetime "created_at"
    #t.datetime "updated_at"
    
    validates_presence_of :title, :body, :user_id
  	validates_uniqueness_of :title, :body
  	
  	validates_attachment_size :photo, :less_than => 10.megabytes
  
    #paperclip
    has_attached_file :photo,
     :styles => {
       :thumb  => "80x50#",
       :show  => "500x375#" 
       }
end
