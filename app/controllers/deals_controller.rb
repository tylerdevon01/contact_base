class DealsController < ApplicationController
    def index
        get_all_deals
    end
    def show
        get_deal
        get_company
    end
    def new
        @deal = current_user.deals.build
    end
    def create
        @deal = current_user.deals.build(deal_params)
        if @deal.save
            redirect_to @deal
        else
            render 'new'
        end
    end
    def edit
        get_deal
    end
    def update
        get_deal
        if @deal.update(deal_params)
            redirect_to @deal
        else
            render 'edit'
        end
    end
    def destroy
        get_deal
        @deal.destroy
        redirect_to deals_url
    end
    def add_contacts
        get_deal
    end
    def add_company
        get_deal
    end
private
    def deal_params
        params.require(:deal).permit(:title, :description, :label, :company_id, contact_ids:[])
    end
    def get_deal
        @deal = current_user.deals.find_by(id:params[:id])
    end
    def get_all_deals
        @deals = current_user.deals.all
    end
    def get_company
        @company = @deal.company
    end
end
