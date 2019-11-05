class EventController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new

  end

  def create
    @create_event = Event.new(
      title: params[:title],
      description: params[:description],
      start_date: params[:start_date],
      duration: params[:duration],
      price: params[:price],
      location: params[:location],
      admin: current_user
    )

    if @create_event.save
      flash[:success] = "BRAVO, votre potin a bien été uploadé"
      redirect_to event_path(@create_event.id)
    else
      flash[:error] = "ROLLBACK, hey ! les validations ne sont pas passées, je te renvoie une ou plusieurs erreurs"
      render :new
    end
  end
end
