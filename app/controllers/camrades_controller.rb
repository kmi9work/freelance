class CamradesController < ApplicationController
  def index
    @camrades = Camrade.all
  end
  
  def show
    @camrade = Camrade.find(params[:id])
    @resumes = @camrade.resumes
  end
  
  def edit
    @camrade = Camrade.find(params[:id])
    if @camrade.resumes.blank?
      @camrade.resumes << Resume.new
    end
    @scopes = Scope.order(:name)
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
