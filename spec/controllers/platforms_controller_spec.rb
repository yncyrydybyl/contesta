require File.dirname(__FILE__) + '/../spec_helper'

describe PlatformsController do
#  fixtures :all
  render_views

  before (:each) do
    @user = Factory.create(:user)
    @admin = Factory.create(:admin)
    @platform = Factory.create(:platform)
  end

  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end

  it "show action should render show template" do
    get :show, :id => Platform.first
    response.should render_template(:show)
  end

  it "new action should render new template for admin" do
    sign_in @admin
    get :new
    response.should render_template(:new)
  end

  it "create action should render new template when model is invalid" do
    sign_in @admin
    Platform.any_instance.stub(:valid?).and_return(false)
    post :create
    response.should render_template(:new)
  end

  it "create action should redirect when model is valid" do
    sign_in @admin
    Platform.any_instance.stub(:valid?).and_return(true)
    post :create
    response.should redirect_to(platform_url(assigns[:platform]))
  end

  it "edit action should render edit template" do
    sign_in @admin
    get :edit, :id => Platform.first
    response.should render_template(:edit)
  end

  it "update action should render edit template when model is invalid" do
    sign_in @admin
    Platform.any_instance.stub(:valid?).and_return(false)
    put :update, :id => Platform.first
    response.should render_template(:edit)
  end

  it "update action should redirect when model is valid" do
    sign_in @admin
    Platform.any_instance.stub(:valid?).and_return(true)
    put :update, :id => Platform.first
    response.should redirect_to(platform_url(assigns[:platform]))
  end

  it "destroy action should destroy model and redirect to index action" do
    sign_in @admin
    platform = Platform.first
    delete :destroy, :id => platform
    response.should redirect_to(platforms_url)
    Platform.exists?(platform.id).should be_false
  end
end
