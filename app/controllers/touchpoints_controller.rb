class TouchpointsController < ApplicationController
    def index
        @contact = current_user.contacts.find_by(id: params[:contact_id])
        @touchpoints = @contact.touchpoints.all
    end
    def show
        get_contact
        get_touchpoint @contact
    end
    def new
        get_contact
        @touchpoint = @contact.touchpoints.build
    end
    def create
        get_contact
        @touchpoint = @contact.touchpoints.build(touchpoint_params)
        add_current_user_to @touchpoint
        if @touchpoint.save
            redirect_to @contact
        else
            render 'new'
        end
    end
    def edit
        get_contact
        get_touchpoint @contact
    end
    def update
        get_contact
        get_touchpoint @contact
        if @touchpoint.update(touchpoint_params)
            redirect_to @contact
        else
            render 'edit'
        end
    end
    def destroy
        get_contact
        get_touchpoint @contact
        @touchpoint.destroy
        redirect_to @contact
    end
    def add_call
        @contact = current_user.contacts.find_by(id:params[:id])
        @touchpoint = @contact.touchpoints.build
    end
    def add_email
        @contact = current_user.contacts.find_by(id:params[:id])
        @touchpoint = @contact.touchpoints.build
    end
    def add_meeting
        @contact = current_user.contacts.find_by(id:params[:id])
        @touchpoint = @contact.touchpoints.build
    end

    # REFACTOR TO SEND W PARAMS, USE ONE CONTROLLER/VIEW
    def show_calls
        @contact = current_user.contacts.find_by(id:params[:id])
        @calls = @contact.touchpoints.where(interaction_type: 1)
    end
    def show_emails
        @contact = current_user.contacts.find_by(id:params[:id])
        @emails = @contact.touchpoints.where(interaction_type: 2)
    end
    def show_meetings
        @contact = current_user.contacts.find_by(id:params[:id])
        @meetings = @contact.touchpoints.where(interaction_type: 3)
    end
    def show_activity
        @contact = current_user.contacts.find_by(id:params[:id])
        @touchpoints = @contact.touchpoints.all
    end

private
    def get_contact
        @contact = current_user.contacts.find_by(id:params[:contact_id])
    end
    def get_touchpoint(contact)
        @touchpoint = contact.touchpoints.find_by(id:params[:id])
    end
    def add_current_user_to(target)
        target.user = current_user
    end
    def touchpoint_params
        params.require(:touchpoint).permit(:description, :interaction_type, :contact_id)
    end
end
