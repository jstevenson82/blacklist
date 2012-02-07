class CreateBusinesses < ActiveRecord::Migration
  def self.up
    create_table :businesses do |t|
      t.string :name
      t.string :address
      t.string :phone
      t.string :zip
      t.string :city
      t.string :state
      t.string :email
      t.string :year_established
      t.string :payment_method
      t.text :parking
      t.string :mon_hours
      t.string :tues_hours
      t.string :wed_hours
      t.string :thurs_hours
      t.string :fri_hours
      t.string :sat_hours
      t.string :sun_hours
      t.string :other_hours
      t.string :parent_cat_id
      t.string :child_cat_id

      t.timestamps
    end
  end

  def self.down
    drop_table :businesses
  end
end
