class ScopesController < ApplicationController
  def destroy
    if params[:project_id]
      project = Project.find(params[:project_id])
      scope = Scope.find(params[:id])
      specializations = scope.specializations
      @scope_id = params[:id]
      project.scopes.delete(scope)
      project.specializations.where(:scope_id => @scope_id).each do |spec|
        project.specializations.delete(spec)
      end
    else
      scope = Scope.find(params[:id])
      scope.destroy
    end
  end
end
