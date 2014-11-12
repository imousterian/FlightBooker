Airport.delete_all
Flight.delete_all

airports = ['SFO', 'LED', 'ORD', 'PAN', 'MDW']

Airport.create([{ code: 'SFO' }, { code: 'LED '}, { code: 'ORD' }, {code: 'PAN' }, {code: 'MDW' }])

flight_names = ['United', 'American', 'Lufthansa', 'Delta', 'Alaska Airlines']

dates = ['1/11/2014', '2/11/2014', '3/11/2014', '4/11/2014', '5/11/2014']

flights = 0

while(flights < 300)

    from_airport = rand(1..5)
    to_airport = rand(1..5)

    if from_airport != to_airport
        airport = rand(0..4)
        date = rand(0..4)
        duration = (rand(120) + 120).minutes
        number = (rand(500) + 100)
        Flight.create(description: flight_names[airport] + " " + number.to_s, date: dates[date], duration: duration, start_id: from_airport, finish_id: to_airport )
    else
        flights -= 1
    end
    flights += 1
end
