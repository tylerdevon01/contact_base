class ContactsController < ApplicationController
    def index
        get_all_contacts
    end
    def show
        get_contact
        @company = current_user.companys.find_by(id: @contact.company)
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
    def add_company
        get_contact
    end

private
    def get_contact
        @contact = Contact.find_by(id:params[:id])
    end
    def get_all_contacts
        if params[:search]
            @contacts = search_contacts(params[:search])
        else
            @contacts = current_user.contacts.all
        end
    end
    def contact_params
        params.require(:contact).permit(:name, :email, :phone, :label, :company_id)
    end
    def search_contacts(search)
        contacts = Contact.order(:name)
        contacts = contacts.where(user_id: current_user.id)
        contacts = contacts.where("name like ?", "%#{search}%") if search.present?
        contacts
      end
end
