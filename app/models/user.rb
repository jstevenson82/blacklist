class User < ActiveRecord::Base
	
    #t.string   "firstname"
    #t.string   "lastname"
    #t.string   "email"
    #t.date     "birthday"
    #t.string   "username"
    #t.string   "user_type"
    #t.string   "crypted_password"
    #t.string   "password_salt"
    #t.string   "persistence_token"
    #t.datetime "created_at"
    #t.datetime "updated_at"
    #t.string   "phone"
    #t.string   "time_zone"

	acts_as_authentic
	
	validates_presence_of :firstname, :lastname, :birthday, :username, :crypted_password, :email
  	validates_uniqueness_of :username, :description, :link
end
