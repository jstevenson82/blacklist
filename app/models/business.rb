class Business < ActiveRecord::Base
  #standard validations will go here
  validates_presence_of :name, :phone, :city, :address, :state, :zip
  validates_uniqueness_of :name
end
