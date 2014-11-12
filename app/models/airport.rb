class Airport < ActiveRecord::Base
    has_many :flights_from, class_name: 'Flight', foreign_key: 'start_id'
    has_many :flights_to, class_name: 'Flight', foreign_key: 'finish_id'
end
