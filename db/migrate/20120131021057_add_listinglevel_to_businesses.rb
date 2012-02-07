class AddListinglevelToBusinesses < ActiveRecord::Migration
  def self.up
    add_column :businesses, :listinglevel, :integer
  end

  def self.down
    remove_column :businesses, :listinglevel
  end
end
