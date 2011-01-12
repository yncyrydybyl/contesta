class PlattformsController < ApplicationController
  load_and_authorize_resource
  def index
    @plattforms = Plattform.all
  end
  
  def show
    @plattform = Plattform.find(params[:id])
  end
  
  def new
    @plattform = Plattform.new
  end
  
  def create
    @plattform = Plattform.new(params[:plattform])
    if @plattform.save
      flash[:notice] = "Successfully created plattform."
      redirect_to @plattform
    else
      render :action => 'new'
    end
  end
  
  def edit
    @plattform = Plattform.find(params[:id])
  end
  
  def update
    @plattform = Plattform.find(params[:id])
    if @plattform.update_attributes(params[:plattform])
      flash[:notice] = "Successfully updated plattform."
      redirect_to @plattform
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @plattform = Plattform.find(params[:id])
    @plattform.destroy
    flash[:notice] = "Successfully destroyed plattform."
    redirect_to plattforms_url
  end
end
