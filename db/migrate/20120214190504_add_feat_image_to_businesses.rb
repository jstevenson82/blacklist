class AddFeatImageToBusinesses < ActiveRecord::Migration
  def change
    add_column :businesses, :feat_image, :string

  end
end
