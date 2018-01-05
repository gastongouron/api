class CreateDemands < ActiveRecord::Migration
  def change
    create_table :demands do |t|
      t.references :user, index: true
      t.decimal :total
      t.string :description
      t.integer :weight

      t.timestamps
    end
  end
end
