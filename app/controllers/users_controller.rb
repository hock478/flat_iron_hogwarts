class UsersController < ApplicationController

    def index 
        @users = User.all
    end

    def new 
        @user = User.new
    end

    def professors
        @professors = User.where(professor: "true")
        render :professors
    end

    def students
        @students = User.where(professor: "false")
        render :students
    end

    def create 
        @user = User.create(user_params)
        if @user.valid?
            @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render :new
        end
    end

    def show 
        @user = User.find(params[:id])
    end

    def logout
      
        session.delete :user_id
        redirect_to "/"
    end

    private
    
    def user_params
        params.require(:user).permit(:name, :password, :email, :password_confirmation, :professor, :house_id)
    end

end
