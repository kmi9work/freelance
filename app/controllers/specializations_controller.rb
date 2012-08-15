class SpecializationsController < ApplicationController
  def index
    if params[:scope_id]
      @specializations = Specialization.order(:name).where("scope_id = ? and name ilike ?", params[:scope_id], "%#{params[:term]}%")
      render json: @specializations.map{|s| {label: s.name, category: s.scope.name}}
    else
      @specializations = Specialization.order(:scope_id).where("name ilike ?", "%#{params[:term]}%")
      render json: @specializations.map{|s| {label: s.name, category: s.scope.name}}
    end
  end
end
