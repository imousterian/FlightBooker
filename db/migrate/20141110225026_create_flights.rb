class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.references :start, index: true
      t.references :finish, index: true
      t.integer :duration
      t.datetime :date
      t.string :description

      t.timestamps
    end
  end
end
