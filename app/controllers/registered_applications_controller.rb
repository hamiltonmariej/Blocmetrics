class RegisteredApplicationsController < ApplicationController
  def index
    @registered_applications = policy_scope(RegisteredApplication)
  end

  def show
    @registered_application = RegisteredApplication.find(params[:id])
    @events = @registered_application.events.group_by(&:name)
  end

  def new
    @registered_application = RegisteredApplication.new
  end

  def create
    @registered_application = current_user.registered_applications.build(registered_application_params)
    @registered_application.user = current_user

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
    @registered_application.assign_attributes(registered_application_params)

    if @registered_application.save
      flash[:notice] = "Your application information was updated."
      redirect_to registered_applications_path
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

  private
  def registered_application_params
    params.require(:registered_application).permit(:name, :url, :user_id)
  end
end
