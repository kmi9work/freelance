class ResumesController < ApplicationController
  def delete_resume_specialization
    @resume = Resume.find(params[:id])
    @specialization = Specialization.find(params[:specialization_id])
    @resume.specializations.delete(@specialization)
  end
  def new
    @resume = Resume.new(camrade_id: params[:camrade_id])
    gon.specializations = Specialization.all
    @scopes = Scope.all
  end
  def create
    @resume = Resume.new(params[:resume])
    respond_to do |format|
      if @resume.save
        format.html { redirect_to @resume.camrade, notice: 'Resume was successfully created.' }
        format.json { render json: @resume, status: :created, location: @resume }
      else
        format.html { render action: "new" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def edit
    @resume = Resume.find(params[:id])
    gon.specializations = Specialization.all
    @scopes = Scope.all
  end
  def update
    @resume = Resume.find(params[:id])
    respond_to do |format|
      if @resume.update_attributes(params[:resume])
        format.html { redirect_to @resume.camrade, notice: 'Resume was successfully created.' }
        format.json { render json: @resume, status: :created, location: @resume }
      else
        format.html { render action: "edit" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end
  def destroy
    camrade = Camrade.find(params[:camrade_id])
    @resume = Resume.find(params[:id])
    @resume.destroy
    redirect_to camrade
  end
end
