class EventsController < ApplicationController
    before_action :authenticate_user!

    def index
        @events = Event.all
        @users = User.all
        @event = current_user.events.build
        @past_events = Event.past(current_user)
        @upcome_events = Event.upcoming(current_user)
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

    def edit
        @event = Event.find(params[:id])
    end

    def update
        @event = Event.find(params[:id])
        if @event.update(events_params)
            redirect_to root_path
        else
            render 'edit'
        end
    end

    def delete_event
        @event = Event.find(params[:id])
        current_user.attended_events.delete(@event)
        redirect_to events_path
    end
    
    def attend_event
        event = Event.find(params[:id])
        current_user.attended_events << event unless current_user.attended_events.include?(event)
        redirect_to events_path
      end
    
      def unattend_event
        event = Event.find(params[:id])
        current_user.attended_events.delete(event)
        redirect_to events_path
      end
    private

    def events_params
       params.require(:event).permit(:title, :date, :location, :description)
    end
end
