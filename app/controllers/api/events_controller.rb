class API::EventsController < API::BaseController
   respond_to :json

   def create
     registered_application = RegisteredApplication.find_by(url: request.env['HTTP_ORIGIN'])
     @event = Event.new(event_params)
     @event.registered_application = registered_application

     if @event.save
       render json: @event, status: :created
     else
       render json: @event.errors, status: :unprocessable_entity
     end
   end

   def preflight
     head 200
   end

  private

  def event_params
    params.permit(:name)
  end

 end
