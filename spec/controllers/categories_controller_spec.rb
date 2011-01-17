require File.dirname(__FILE__) + '/../spec_helper'

describe CategoriesController do
#  fixtures :all
  render_views
  before (:each) do
    @category = Factory.create(:category)
    @admin = Factory.create(:admin)
  end
  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end
  
  it "show action should render show template" do
    get :show, :id => Category.first
    response.should render_template(:show)
  end
  
  it "new action should render new template" do
    sign_in @admin
    get :new
    response.should render_template(:new)
  end
  
  it "create action should render new template when model is invalid" do
    sign_in @admin
    Category.any_instance.stubs(:valid?).returns(false)
    post :create
    response.should render_template(:new)
  end

  it "create action should redirect when model is valid" do
    sign_in @admin
    Category.any_instance.stubs(:valid?).returns(true)
    post :create
    response.should redirect_to(category_url(assigns[:category]))
  end
  
  it "edit action should render edit template" do
    sign_in @admin
    get :edit, :id => Category.first
    response.should render_template(:edit)
  end
  
  it "update action should render edit template when model is invalid" do
    sign_in @admin
    Category.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Category.first
    response.should render_template(:edit)
  end

  it "update action should redirect when model is valid" do
    sign_in @admin
    Category.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Category.first
    response.should redirect_to(category_url(assigns[:category]))
  end
  
  it "destroy action should destroy model and redirect to index action" do
    sign_in @admin
    category = Category.first
    delete :destroy, :id => category
    response.should redirect_to(categories_url)
    Category.exists?(category.id).should be_false
  end
end
