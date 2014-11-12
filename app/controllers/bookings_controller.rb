class BookingsController < ApplicationController
    def new
        @flight = Flight.find(params[:flight_id])
        @booking = Booking.new
        params[:passengers].to_i.times { @booking.passengers.build }

    end

    def create
        @booking = Booking.new(booking_params)
        if @booking.save
            @booking.passengers.each do |passenger|
                PassengerMailer.thank_you_email(passenger).deliver
            end
            redirect_to @booking
        else
            @flight = Flight.find(params[:flight_id])
            flash.now[:danger] = "Make sure the passenger information is correct."
            render 'new'
        end
    end

    def show
        @booking = Booking.find(params[:id])
    end

    private
        def booking_params
            params.require(:booking).permit(:flight_id, passengers_attributes: [:id, :name, :email])
        end
end
