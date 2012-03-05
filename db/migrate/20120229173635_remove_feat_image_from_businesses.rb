class RemoveFeatImageFromBusinesses < ActiveRecord::Migration
  def up
    remove_column :businesses, :feat_image
      end

  def down
    add_column :businesses, :feat_image, :string
  end
end
