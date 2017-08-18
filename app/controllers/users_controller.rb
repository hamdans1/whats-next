class UsersController < ApplicationController
    
    def index
        @users = User.all
    end

    def show
        @user = current_user

        if @user.nil?
            redirect_to new_user_registration_path
        end
    end
    
end
