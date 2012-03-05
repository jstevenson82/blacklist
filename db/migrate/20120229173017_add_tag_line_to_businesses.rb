class AddTagLineToBusinesses < ActiveRecord::Migration
  def change
    add_column :businesses, :tag_line, :string

  end
end
