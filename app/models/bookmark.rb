class Bookmark < ActiveRecord::Base
	validates_uniqueness_of :user_id, :scope => :b_id
end
