class FlightsController < ApplicationController

    def index
        @flights = Flight.all
        @airports = Airport.all.map do |airport|
            [airport.code, airport.id]
        end
        @dates = Flight.flight_dates
        @search_results = Flight.search(params)
    end

end
