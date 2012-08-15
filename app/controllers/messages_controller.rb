class MessagesController < ApplicationController
  def show
    @message = Message.find(params[:id])
    @message.unread = false
    @message.save
    @answer = Message.new
    @camrade = current_camrade
  end
  
  def create
    @answer = Message.new(params[:message])
    if @answer.save
      respond_to do |format|
        format.html{ redirect_to @answer.parent }
        format.json
      end
    else
      respond_to do |format|
        format.html{ redirect_to @answer.parent || current_camrade }
        format.json
      end
    end
  end
end
