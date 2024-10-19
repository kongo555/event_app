class V1::EventsController < ApplicationController
  skip_before_action :authenticate_devise_api_token!, only: :index
  before_action :set_event, only: %i[ update destroy ]
  before_action :check_if_admin, except: :index

  # GET /events
  def index
    @events = Event.all

    render json: @events
  end

  # GET /events/1
  def show
    @event = Event.includes(:users).find(params[:id])
    render json: @event.to_json(include: :users)
  end

  # POST /events
  def create
    @event = Event.new(event_params)

    if @event.save
      render json: @event, status: :created, location: v1_events_url(@event)
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /events/1
  def update
    if @event.update(event_params)
      render json: @event
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  # DELETE /events/1
  def destroy
    @event.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_params
      params.require(:event).permit(:name, :start_at, :capacity)
    end
end
