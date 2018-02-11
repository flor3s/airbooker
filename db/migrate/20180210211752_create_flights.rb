class CreateFlights < ActiveRecord::Migration[5.1]
  def change
    create_table :flights do |t|
      t.datetime :departure_time
      t.integer :duration
      t.references :origin, index: true, foreign_key: { to_table: :airports }
      t.references :destination, index: true, foreign_key: { to_table: :airports }

      t.timestamps
    end
  end
end
