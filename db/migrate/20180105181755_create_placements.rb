class CreatePlacements < ActiveRecord::Migration
  def change
    create_table :placements do |t|
      t.references :demand, index: true
      t.references :trip, index: true

      t.timestamps
    end
  end
end
