class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.string :user_id
      t.string :item_id
      t.text :body
      t.integer :rating

      t.timestamps
    end
  end

  def self.down
    drop_table :comments
  end
end
