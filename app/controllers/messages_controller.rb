class MessagesController < ApplicationController

  def index
  end

  def create
    @message = Message.new
    @message.send(params)
    redirect_to messages_path
  end

end
