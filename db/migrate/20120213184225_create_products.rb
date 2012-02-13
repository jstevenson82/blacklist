class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :b_id
      t.string :title
      t.text :body
      t.string :price

      t.timestamps
    end
  end
end
