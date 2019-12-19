class CompaniesController < ApplicationController
    def index
        get_all_companys
    end
    def show
        get_company
    end
    def new
        @company = current_user.companys.build
    end
    def create
        @company = current_user.companys.build(company_params)

        if @company.save
            redirect_to @company
        else
            render 'new'
        end
    end
    def edit
        get_company
    end
    def update
        get_company

        if @company.update(company_params)
            redirect_to @company
        else
            render 'edit'
        end
    end
    def destroy
        get_company
        @company.destroy
        redirect_to companies_url
    end
    def add_contacts
        get_company
    end
private
    def get_company
        @company = Company.find_by(id:params[:id])
    end
    def get_all_companys
        if params[:search]
            @companys = search_companies(params[:search])
        else
            @companys = current_user.companys.all
        end
    end
    def company_params
        params.require(:company).permit(:name, :description, :phone, contact_ids:[])
    end
    def search_companies(search)
        companys = Company.order(:name)
        companys = companys.where(user_id: current_user.id)
        companys = companys.where("name like ?", "%#{search}%") if search.present?
        companys
    end
end

