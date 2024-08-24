class EventsController < ApplicationController
    before_action :authenticate_user!

    def index
        @events = Event.all
        @users = User.all
        @event = current_user.events.build
    end

    def create
       @event = current_user.events.build(events_params)
       if @event.save
          redirect_to root_path
       else 
          @events = Event.all
          render :index
       end
    end

    private

    def events_params
       params.require(:event).permit(:title, :date, :location, :description)
    end
end
