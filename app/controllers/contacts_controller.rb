class ContactsController < ApplicationController
    def index
        @contacts = current_user.contacts.all
    end
    def show
        get_contact
    end
    def new
        @contact = current_user.contacts.build
    end
    def create
        @contact = current_user.contacts.build(contact_params)

        if @contact.save
            redirect_to @contact
        else
            render 'new'
        end
    end
    def edit
        get_contact
    end
    def update
        get_contact

        if @contact.update(contact_params)
            redirect_to @contact
        else
            render 'edit'
        end
    end
    def destroy
        get_contact
        @contact.destroy
        redirect_to contacts_url
    end
private
    def get_contact
        @contact = Contact.find_by(id:params[:id])
    end
    def contact_params
        params.require(:contact).permit(:name, :email, :phone)
    end
end
