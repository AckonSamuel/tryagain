class MessagesController < ApplicationController

  # GET /messages
  def index
    message = Message.first

    render json: message
  end
end
