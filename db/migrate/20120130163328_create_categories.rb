class CreateCategories < ActiveRecord::Migration
  def self.up
    create_table :categories do |t|
      t.string :title
      t.integer :parent_cat_id
      t.integer :child_cat_id

      t.timestamps
    end
  end

  def self.down
    drop_table :categories
  end
end
