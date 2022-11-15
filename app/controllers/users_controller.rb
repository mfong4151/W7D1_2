class UsersController < ApplicationController

    def create
        new_password = password=(params[:password])
        User.create(params[:username], new_password)

    end

    def new

        render :new

    end



end
