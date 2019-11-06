class EventController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
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
      flash[:success] = "Votre event a bien été uploadé"
      redirect_to event_path(@create_event.id)
    else
      flash[:error] = "ROLLBACK, entrées invalide"
      render :new
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    event_params = params.require(:event).permit(:title, :duration, :start_date, :price, :location, :description)
    if @event.update(event_params)
      flash[:success] = "Votre event a bien été modifié"
      redirect_to event_attendance_index_path(@event.id)
    else
      flash[:error] = "Une erreur s'est produite, vérifié les informations"
      render :edit
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    flash[:success] = "Event supprimé"
    redirect_to event_index_path
  end
end
