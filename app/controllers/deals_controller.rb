class DealsController < ApplicationController
    def index
        @deals = current_user.deals.all
    end
    def show
        @deal = current_user.deals.find_by(id:params[:id])
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
        @deal = current_user.deals.find_by(id:params[:id])
    end
    def update
        @deal = current_user.deals.find_by(id:params[:id])
        if @deal.update(deal_params)
            redirect_to @deal
        else
            render 'edit'
        end
    end
    def destroy
        @deal = current_user.deals.find_by(id:params[:id])
        @deal.destroy
        redirect_to deals_url
    end
private
    def deal_params
        params.require(:deal).permit(:title, :description)
    end
end
