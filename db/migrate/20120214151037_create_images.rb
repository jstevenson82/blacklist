class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :b_id
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
