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
        params.require(:touchpoint).permit(:description, :contact_id)
    end
end
