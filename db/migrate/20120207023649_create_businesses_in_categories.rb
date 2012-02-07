class CreateBusinessesInCategories < ActiveRecord::Migration
  def change
    create_table :businesses_in_categories do |t|
      t.string :b_id
      t.string :cat_id

      t.timestamps
    end
  end
end
