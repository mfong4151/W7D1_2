class UsersController < ApplicationController

    def create

        user = User.create(username: params[:user][:username], params[:user][:password], session_token:  )
        # user.create!

    end

    def new

        render :new

    end



end
