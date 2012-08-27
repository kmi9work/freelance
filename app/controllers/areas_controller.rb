class AreasController < ApplicationController
  def destroy
    if params[:project_id]
      project = Project.find(params[:project_id])
      area = Area.find(params[:id])
      specializations = area.specializations
      @area_id = params[:id]
      project.areas.delete(area)
      project.specializations.where(:area_id => @area_id).each do |spec|
        project.specializations.delete(spec)
      end
    else
      area = Area.find(params[:id])
      area.destroy
    end
  end
end
