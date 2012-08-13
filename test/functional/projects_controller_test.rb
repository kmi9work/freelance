require 'test_helper'

class ProjectsControllerTest < ActionController::TestCase
  setup do
    @project = projects(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:projects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create project" do
    assert_difference('Project.count') do
      post :create, project: { city_id: @project.city_id, completed: @project.completed, camrade_count: @project.camrade_count, camrade_id: @project.camrade_id, country_id: @project.country_id, datetime_end: @project.datetime_end, datetime_start: @project.datetime_start, description: @project.description, min_experience: @project.min_experience, reserve_count: @project.reserve_count, title: @project.title }
    end

    assert_redirected_to project_path(assigns(:project))
  end

  test "should show project" do
    get :show, id: @project
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @project
    assert_response :success
  end

  test "should update project" do
    put :update, id: @project, project: { city_id: @project.city_id, completed: @project.completed, camrade_count: @project.camrade_count, camrade_id: @project.camrade_id, country_id: @project.country_id, datetime_end: @project.datetime_end, datetime_start: @project.datetime_start, description: @project.description, min_experience: @project.min_experience, reserve_count: @project.reserve_count, title: @project.title }
    assert_redirected_to project_path(assigns(:project))
  end

  test "should destroy project" do
    assert_difference('Project.count', -1) do
      delete :destroy, id: @project
    end

    assert_redirected_to projects_path
  end
end
