class ContactsController < ApplicationController
    def index
        @contacts = current_user.contacts.all
    end
    def show
        @contact = Contact.find_by(id:params[:id])
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
        @contact = Contact.find_by(id:params[:id])
    end
    def update
        @contact = Contact.find_by(id:params[:id])
        if @contact.update(contact_params)
            redirect_to @contact
        else
            render 'edit'
        end
    end
    def destroy
        @contact = Contact.find_by(id:params[:id])
        @contact.destroy
        redirect_to contacts_url
    end
private
    def contact_params
        params.require(:contact).permit(:name, :email, :phone)
    end
end
