class CreatePassengerBookings < ActiveRecord::Migration
  def change
    create_table :passenger_bookings do |t|
        t.references :booking
        t.references :passenger
        t.timestamps
    end
    add_index :passenger_bookings, :booking_id
    add_index :passenger_bookings, :passenger_id
  end
end
