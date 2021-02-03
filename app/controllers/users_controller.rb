class UsersController < ApplicationController
    def new
        @user = User.new
    end
    
    def create
        @user = User.new(user_params)
        respond_to do |format|
            if @user.save
                session[:user_id] = @user.id
                format.html { redirect_to root_path }
            else
                format.html { render :new }
            end
        end
    end
    
    def show
        @posts = Post.where(user_id: current_user.id)
    end

    private
    def user_params
        params.require(:user).permit(:name, :email, :password)
    end
end