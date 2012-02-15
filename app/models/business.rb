class Business < ActiveRecord::Base
	
    #t.string   "name"
    #t.string   "address"
    #t.string   "phone"
    #t.string   "zip"
    #t.string   "city"
    #t.string   "state"
    #t.string   "email"
    #t.string   "year_established"
    #t.string   "payment_method"
    #t.text     "parking"
    #t.string   "mon_hours"
    #t.string   "tues_hours"
    #t.string   "wed_hours"
    #t.string   "thurs_hours"
    #t.string   "fri_hours"
    #t.string   "sat_hours"
    #t.string   "sun_hours"
    #t.string   "other_hours"
    #t.string   "parent_cat_id"
    #t.string   "child_cat_id"
    #t.datetime "created_at"
    #t.datetime "updated_at"
    #t.string   "website"
    #t.integer  "listinglevel"
    #t.integer  "status" { 1 - on or 0 - off Default is 1 }  
    #t.text     description
    
  #standard validations will go here
  validates_presence_of :name, :phone, :city, :address, :state, :zip, :description
  validates_uniqueness_of :name
  
  validates_attachment_size :photo, :less_than => 10.megabytes
  
  #paperclip
  has_attached_file :photo,
     :styles => {
       :thumb  => "80x50#",
       :feature  => "400x250#",
       :lightbox  => "500x375#" 
       }
  
  validate :presence_of_time
 
  private
  
  def presence_of_time
  	if ( self.mon_hours.empty? and self.tues_hours.empty? and self.wed_hours.empty? and self.thurs_hours.empty? and self.fri_hours.empty? and self.sat_hours.empty? and self.sun_hours.empty? and self.other_hours.empty? )
  		self.errors.add :base, "At least one business hour field must be filled in."
  	end
  end
end
