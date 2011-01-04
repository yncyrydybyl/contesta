class SubmissionsController < ApplicationController
  before_filter :authenticate_user!
  def index
    @submissions = Submission.all
  end
  
  def show
    @submission = Submission.find(params[:id])
  end
  
  def new
    @submission = Submission.new
    5.times {@submission.assets.build}
  end
  
  def create
    @submission = Submission.new(params[:submission])
    @submission.user_id = current_user.id
    if @submission.save
      flash[:notice] = "Successfully created submission."
      redirect_to @submission
    else
      render :action => 'new'
    end
  end
  
  def edit
    @submission = Submission.find(params[:id])
    5.times {@submission.assets.build}
  end
  
  def update
    @submission = Submission.find(params[:id])
    if @submission.update_attributes(params[:submission])
      flash[:notice] = "Successfully updated submission."
      redirect_to @submission
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @submission = Submission.find(params[:id])
    @submission.destroy
    flash[:notice] = "Successfully destroyed submission."
    redirect_to submissions_url
  end
end
