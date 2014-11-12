class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
        t.references :flight, index: true
        t.timestamps
    end
  end
end
