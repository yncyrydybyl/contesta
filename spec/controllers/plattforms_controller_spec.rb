require File.dirname(__FILE__) + '/../spec_helper'

describe PlattformsController do
  fixtures :all
  render_views
  include Devise::TestHelpers

  before (:each) do
    @user = Factory.create(:user)
    sign_in @user
  end

  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end
  
  it "show action should render show template" do
    get :show, :id => Plattform.first
    response.should render_template(:show)
  end
  
  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end
  
  it "create action should render new template when model is invalid" do
    Plattform.any_instance.stubs(:valid?).returns(false)
    post :create
    response.should render_template(:new)
  end

  it "create action should redirect when model is valid" do
    Plattform.any_instance.stubs(:valid?).returns(true)
    post :create
    response.should redirect_to(plattform_url(assigns[:plattform]))
  end
  
  it "edit action should render edit template" do
    get :edit, :id => Plattform.first
    response.should render_template(:edit)
  end
  
  it "update action should render edit template when model is invalid" do
    Plattform.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Plattform.first
    response.should render_template(:edit)
  end

  it "update action should redirect when model is valid" do
    Plattform.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Plattform.first
    response.should redirect_to(plattform_url(assigns[:plattform]))
  end
  
  it "destroy action should destroy model and redirect to index action" do
    plattform = Plattform.first
    delete :destroy, :id => plattform
    response.should redirect_to(plattforms_url)
    Plattform.exists?(plattform.id).should be_false
  end
end
