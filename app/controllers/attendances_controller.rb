class AttendancesController < ApplicationController
    # def create
        
    #     @event = Event.find(params[:event_id])
    #     @attendance = @event.attendances.build(attendee: current_user)
    #     if @attendance.save
    #         redirect_to event_path(@event), notice: 'You have successfully joined the event.'
    #     else
    #         redirect_to event_path(@event), alert: 'Unable to join the event.'
    #     end
    # end

    # def destroy
    #     @event = Event.find(params[:event_id])
    #     @attendance = @event.attendances.find_by(attendee: current_user)
    
    #     if @attendance.destroy
    #       redirect_to event_path(@event), notice: 'You have successfully left the event.'
    #     else
    #       redirect_to event_path(@event), alert: 'Unable to leave the event.'
    #     end
    # end
end
