class RoomsController < ApplicationController
  # GET /
  def show
    @messages = Message.all
  end
end
