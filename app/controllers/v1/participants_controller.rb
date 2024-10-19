class V1::ParticipantsController < ApplicationController
  def index
    render json: current_user.events
  end

  def create
    @event = Event.find(params[:event_id])
    @participant = Participant.new(event: @event, user: current_user)

    if @participant.save
      render json: @event, status: :created
    else
      render json: @participant.errors, status: :unprocessable_entity
    end
  end
end
