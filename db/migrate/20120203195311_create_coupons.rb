class CreateCoupons < ActiveRecord::Migration
  def change
    create_table :coupons do |t|
      t.string :b_id
      t.string :headline
      t.text :body
      t.date :expire
      t.string :exclusion
      t.string :user_id

      t.timestamps
    end
  end
end
