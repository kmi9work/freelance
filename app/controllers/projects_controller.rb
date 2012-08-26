class ProjectsController < ApplicationController
  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.text_search(params[:query]).page(params[:page]).per_page(10)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @projects }
    end
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @project = Project.find(params[:id])
    @scope_specs = {}
    @project.specializations.each do |spec|
      @scope_specs[spec.scope.id] ||= [spec.scope.name, []]
      @scope_specs[spec.scope.id][1] << [spec.id, spec.name]
    end
    @project.scopes.each do |scope|
      @scope_specs[scope.id] ||= [scope.name, []]
    end
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @project }
    end
  end

  # GET /projects/new
  # GET /projects/new.json
  def new
    @project = Project.new
    @scopes = Scope.all
    gon.scopes = @scopes
    gon.scope_id = ProjectScope.last.id + 1
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @project }
    end
  end

  # GET /projects/1/edit
  def edit
    @project = Project.find(params[:id])
    @scopes = Scope.all
    @scope_specs = {}
    @project.specializations.each do |spec|
      @scope_specs[spec.scope.id] ||= [spec.scope.name, []]
      @scope_specs[spec.scope.id][1] << [spec.id, spec.name]
    end
    @project.scopes.each do |scope|
      @scope_specs[scope.id] ||= [scope.name, []]
    end
    gon.scopes = @scopes
    gon.scope_id = ProjectScope.last.id + 1
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(params[:project])
    @project.camrade = current_camrade

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render json: @project, status: :created, location: @project }
      else
        format.html do
          @scopes = Scope.all
          render action: "new"
        end
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /projects/1
  # PUT /projects/1.json
  def update
    @project = Project.find(params[:id])

    respond_to do |format|
      if @project.update_attributes(params[:project])
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to projects_url }
      format.json { head :no_content }
    end
  end
  
  def add_scopes
    @project = Project.find(params[:id])
  end
  
  def add_specializations
    @project = Project.find(params[:id])
  end
end
