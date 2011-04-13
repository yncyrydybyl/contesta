class PlatformsController < ApplicationController
  load_and_authorize_resource
  def index
    @platforms = Platform.all
  end
  
  def show
    @platform = Platform.find(params[:id])
    @submissions = @platform.submissions.reverse
  end
  
  def new
    @platform = Platform.new
  end
  
  def create
    @platform = Platform.new(params[:platform])
    if @platform.save
      flash[:notice] = "Successfully created platform."
      redirect_to @platform
    else
      render :action => 'new'
    end
  end
  
  def edit
    @platform = Platform.find(params[:id])
  end
  
  def update
    @platform = Platform.find(params[:id])
    if @platform.update_attributes(params[:platform])
      flash[:notice] = "Successfully updated platform."
      redirect_to @platform
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @platform = Platform.find(params[:id])
    @platform.destroy
    flash[:notice] = "Successfully destroyed platform."
    redirect_to platforms_url
  end
end
