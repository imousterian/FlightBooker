class Flight < ActiveRecord::Base
    belongs_to :from_airport, class_name: 'Airport', foreign_key: 'start_id'
    belongs_to :to_airport, class_name: 'Airport', foreign_key: 'finish_id'

    def date_format
        "#{Time.at(date).utc.strftime("%m/%d/%Y")} at #{Time.at(date).utc.strftime("%H:%M")}"
    end

    def time_in_hours
        "#{Time.at(duration).utc.strftime("%H:%M")} hours"
    end

    def self.flight_dates
        self.pluck(:date).map { |x| x.strftime('%m/%d/%Y') }.sort.uniq
    end

    def self.search(params)
        self.where(:date => params[:date], :start_id => params[:start], :finish_id => params[:finish])
    end
end
