class AttendanceController < ApplicationController
  before_action :authenticate_user!
  before_action :already_participate?, only: [:create]
  before_action :is_admin?, only: [:index]

  def index
    @event = Event.find(params[:event_id])
  end

  def create
    @event = Event.find(params[:event_id])
    @user = current_user
    @attendance = Attendance.new(event: @event, participant: @user)

      @amount = @event.price

      customer = Stripe::Customer.create({
        email: params[:stripeEmail],
        source: params[:stripeToken],
      })

      charge = Stripe::Charge.create({
        customer: customer.id,
        amount: @amount,
        description: 'Rails Stripe customer',
        currency: 'eur',
      })

      @attendance.save
      flash[:succes] = "Votre particiation a bien été prit en compte"
      redirect_to event_path(params[:event_id])

      rescue Stripe::CardError => e
        flash[:error] = e.message
        redirect_to event_path(params[:event_id])
  end

private

  def already_participate?
    Attendance.where(event: params[:event_id]).each do |res|
      if res.participant == current_user
        flash[:error] = "Vous participez deja à l'évènement"
        redirect_to event_path(params[:event_id])
      end
    end
  end

  def is_admin?
    @event = Event.find(params[:event_id])
    unless @event.admin == current_user
      flash[:error] = "Vous n'êtes pas l'admin"
      redirect_to event_path(params[:event_id])
    end
  end
end
