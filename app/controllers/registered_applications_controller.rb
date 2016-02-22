class RegisteredApplicationsController < ApplicationController
  def index
    @registered_applications = RegisteredApplication.all
  end

  def show
    @registered_application = RegisteredApplication.find(params[:id])
  end

  def new
    @registered_application = RegisteredApplication.new
  end

  def create
    @registered_application = RegisteredApplication.new
    @registered_application.name = params[:registered_application][:name]
    @registered_application.url = params[:registered_application][:url]

    if @registered_application.save
      flash[:notice] = "Your application is registered."
      redirect_to @registered_application
    else
      flash.now[:alert] = "There was an error registering your application.  Please try again."
      render :new
    end
  end

  def edit
    @registered_application = RegisteredApplication.find(params[:id])
  end

  def update
    @registered_application = RegisteredApplication.find(params[:id])
    @registered_application.name = params[:registered_application][:name]
    @registered_application.url = params[:registered_application][:url]

    if @registered_application.save
      flash[:notice] = "Registered application was updated."
      redirect_to @registered_application
    else
      flash.now[:alert] = "There was an error saving the updates to your registered application.  Please try again."
      render :edit
    end
  end

  def destroy
    @registered_application = RegisteredApplication.find(params[:id])
    if @registered_application.destroy
      flash[:notice] = "\"#{@registered_application.name}\" was deleted successfully."
      redirect_to registered_applications_path
    else
      flash.now[:alert] = "There was an error deleting this registered application.  Please try again."
      render :show
    end
  end
end
