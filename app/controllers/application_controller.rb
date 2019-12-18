class ApplicationController < ActionController::Base
    include ContactsHelper
    before_action :authenticate_user!
end
