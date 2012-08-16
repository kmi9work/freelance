class SpecializationsController < ApplicationController
  def index
    if params[:scope_id]
      @specializations = Specialization.order(:name).where("scope_id = ? and name ilike ?", params[:scope_id], "%#{params[:term]}%")
      p @specializations
      render json: @specializations
    else
      @specializations = Specialization.order(:scope_id).where("name ilike ?", "%#{params[:term]}%")
      p @specializations
      render json: @specializations
    end
  end
  def add_scope
  end
end
