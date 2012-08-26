class SpecializationsController < ApplicationController
  def index
    if params[:scope_id]
      @specializations = Specialization.order(:name).where("scope_id = ? and name ilike ?", params[:scope_id], "%#{params[:term]}%")
      render json: @specializations
    else
      render json: []
    end
  end
  def add_scope
  end
  def destroy
    if params[:project_id]
      project = Project.find(params[:project_id])
      specialization = Specialization.find(params[:id])
      @specialization_id = params[:id]
      project.specializations.delete(specialization)
    else
      specialization = Specialization.find(params[:id])
      specialization.destroy
    end
  end
end
