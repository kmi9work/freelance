class ResumesController < ApplicationController
  def delete_resume_specialization
    @resume = Resume.find(params[:id])
    @specialization = Specialization.find(params[:specialization_id])
    @resume.specializations.delete(@specialization)
  end
end
