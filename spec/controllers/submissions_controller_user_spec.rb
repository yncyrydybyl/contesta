require File.dirname(__FILE__) + '/../spec_helper'

describe SubmissionsController do
  render_views

  before (:each) do
    @user = Factory.create(:user)
    @category = Factory.create(:category)
    @platform = Factory.create(:platform)
    @submission = Factory.create(:submission, :user => @user)
    @submission.platform = @platform
    @submission.category = @category
    sign_in @user
  end

  after :each do
    DatabaseCleaner.clean
  end


  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end

  it "show action should render show template" do
    get :show, :id => Submission.first
    response.should render_template(:show)
  end

  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end

  it "create action should render new template when model is invalid" do
    Submission.any_instance.stub(:valid?).and_return(false)
    post :create
    response.should render_template(:new)
  end

  it "create action should redirect when model is valid" do
    Submission.any_instance.stub(:valid?).and_return(true)
    post :create
    response.should redirect_to(submission_url(assigns[:submission]))
  end

  it "edit action should render edit template" do
    get :edit, :id => Submission.first
    response.should render_template(:edit)
  end

  it "update action should render edit template when model is invalid" do
    Submission.any_instance.stub(:valid?).and_return(false)
    put :update, :id => Submission.first
    response.should render_template(:edit)
  end

  it "update action should redirect when model is valid" do
    Submission.any_instance.stub(:valid?).and_return(true)
    put :update, :id => Submission.first
    response.should redirect_to(submission_url(assigns[:submission]))
  end

  it "destroy action should destroy model and redirect to index action" do
    submission = Submission.first
    delete :destroy, :id => submission
    response.should redirect_to(submissions_url)
    Submission.exists?(submission.id).should be_false
  end
end
