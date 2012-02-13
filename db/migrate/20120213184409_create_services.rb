class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :b_id
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
