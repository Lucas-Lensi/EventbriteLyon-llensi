class UserMailer < ApplicationMailer
  default from: 'no-reply@eventbrite-lyon.fr'

  def welcome_email(user)
    @user = user
    @url = 'https://git.heroku.com/eventbritelyon-llensi.git'
    mail(to: @user.email, subject: 'Bienvenue sur Evenbrite Lyon !')
  end
end
