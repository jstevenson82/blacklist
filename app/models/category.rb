class Category < ActiveRecord::Base
	validates_uniqueness_of :title, :child_cat_id
	validates_presence_of :title, :child_cat_id
end
