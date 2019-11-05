class AttendanceMailer < ApplicationMailer
  default from: 'no-reply@eventbrite-lyon.fr'

  def reservation_admin_email(reservation)
    @reservation = reservation
    @admin = @reservation.event.admin
    @participant = @reservation.participant
    @url = 'https://git.heroku.com/eventbritelyon-llensi.git'
    mail(to: @admin.email, subject: "Quelqu'un partiticipe à votre évènement")
  end
end
