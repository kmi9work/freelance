class CamradesController < ApplicationController
  def index
    @camrades = Camrade.all
  end
  
  def show
    @camrade = Camrade.find(params[:id]) || current_camrade
    @resumes = @camrade.resumes
  end
  
  def show_messages
    @camrade = Camrade.find(params[:camrade_id]) || current_camrade
    @messages = @camrade.messages.order('id desc')
    @sents = @camrade.sents
  end
  
  def edit
    @camrade = Camrade.find(params[:id])
  end
  
  def update
    @camrade = Camrade.find(params[:id])
    if @camrade.update_attributes(params[:camrade])
      redirect_to @camrade
    else
      render action: 'edit'
    end
  end
end
