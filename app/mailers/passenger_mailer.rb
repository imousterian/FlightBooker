class PassengerMailer < ActionMailer::Base
    default from: "info@info.info"

    def thank_you_email(passenger)
        @passenger = passenger
        @booking = @passenger.bookings.last
        @url = 'https://one-way-ticket.herokuapp.com'
        email_with_name = "#{@passenger.name} <#{@passenger.email}>"
        mail(to: email_with_name, subject: 'Thank you for booking at our site!')
    end
end
