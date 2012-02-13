class AddStatusToBusinesses < ActiveRecord::Migration
  def change
    add_column :businesses, :status, :integer, :null => false, :default => 1

  end
end
