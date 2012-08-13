class SpecializationsController < ApplicationController
  def index
    if params[:scope_id]
      @specializations = Specialization.order(:name).where("scope_id = ? and name like ?", params[:scope_id], "%#{params[:term]}%")
      render json: @specializations.map(&:name)
    else
      @specializations = Specialization.order(:name).where("name like ?", "%#{params[:term]}%")
      render json: @specializations.map(&:name)
    end
  end
end
