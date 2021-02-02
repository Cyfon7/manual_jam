class SessionsController < ApplicationController
    def new
#        session[:current_user] = {
#            cookies_id: {
#                email: @current_user.email
#                user_id: @current_user.user_id
#            }
#        }
#        cookies[:session_id] = 'cookies_id'   
    end

    def create
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to root_path, notice: 'Log in Successfully'
        else
            flash.now[:notice] = 'Email or password invalid'
            render action: :new
        end
    end
    
    def destroy
        session[:user_id] = nil
        redirect_to root_url, notice: 'Log out successfully'
    end
end