class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :title, default: ""
      t.string :from_city, default: ""
      t.string :to_city, default: ""
      t.datetime :start_date, default: DateTime.now.utc.beginning_of_day
      t.datetime :end_date, default: DateTime.now.utc.end_of_day
      t.decimal :price, default: 0.0
      t.boolean :published, default: false
      t.integer :user_id

      t.timestamps
    end
    add_index :trips, :user_id
  end
end
