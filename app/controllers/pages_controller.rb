class PagesController < ApplicationController
    def home
        @current_user = current_user ? current_user : current_admin_user
    end
end
