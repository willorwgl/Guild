class Api::SessionsController < ApplicationController 

    def create
        usernameError = { error: "The username you've entered does not match any account"}
        passwordError = { error: "The password you've entered is incorrect" }
        @user = User.includes(:characters).find_by(username: params[:user][:username])
        unless @user 
          render json: usernameError, status: 422 
          return
        end
        @user = User.find_by_credentials(@user, params[:user][:password])
        if @user 
          login(@user)
          render 'api/users/show'
        else
          render json: passwordError, status: 422
        end
      end
  
      def destroy
        render json: {error: "Account not found"}, status: 404  unless current_user
        logout
      end
end