class Category < ActiveRecord::Base
	validates_uniqueness_of :title, :child_cat_id
end
