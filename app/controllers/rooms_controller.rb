class RoomsController < ApplicationController
  # GET /
  def index
    @rooms = Room.all
  end

  # GET /:room
  def show
    @room = Room.where(name: params[:room]).first
    redirect_to root_url unless @room
  end
end
