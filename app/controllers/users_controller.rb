class UsersController < ApplicationController
    before_action :set_current_user, except: [:index, :new, :home]
    before_action :find_user, only: [:destroy, :sorting, :edit, :show, :edit_subjects, :update_subjects, :edit_courses]
    
    
    def index 
        @users = User.all
    end

    def new 
        @user = User.new
    end

    def new_professor
        @user = User.new
        @user.courses.build
    end

    def create_professor
        
        @user = User.new(user_params)
        # byebug
        if @user.valid?
            @user.save
            session[:user_id] = @user.id
            redirect_to sorting_hat_path(@user)
        else
            
            render :new_professor
        end
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
            redirect_to sorting_hat_path(@user)
        else
            render :new
        end
    end

    def edit 
        if @current != @user
            redirect_to "/"
        end
    end

    def update 
        @user = @current
        @user.update(user_params)
        if @user.valid?
            @user.save
            redirect_to user_path(@user)
        else
            
            render :edit
        end
    end

    def show 
        @friend = Friend.new
    end

    def edit_subjects
        if @current == nil
            redirect_to "/"
        end
    end

    def update_subjects
        @enroll = Enrollment.create(subject_id: params[:user][:subject_ids], student: @user)
        if @enroll.valid?
            @enroll.save
            redirect_to student_edit_subjects_path(@current)
        else   
            render :edit_subjects
        end
    end

    def home
    end

    def sorting 
        if @current == nil || @current != @user
            redirect_to "/"
        end
    end

    def sorted
        @user = @current
        if !params[:user][:quiz][:q2] && !params[:user][:quiz][:q3] && !params[:user][:quiz][:q4]
          @user.update(house: House.find_by(name: params[:user][:quiz][:q1]))
            @user.save
        else
        answer = params[:user][:quiz][:q1].to_i +params[:user][:quiz][:q2].to_i + params[:user][:quiz][:q3].to_i + params[:user][:quiz][:q4].to_i 
         @user.sort_me(answer)
        end
        redirect_to user_path(@user)
    end

    def destroy
        @user.destroy
        session.delete :user_id
        redirect_to '/'
    end

    private

    def find_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:name, :password, :email, :password_confirmation, :professor, :house_id, :subject_ids, :quiz, :q1, :q2, :q3, :q4, courses_attributes: :name )
    end

end
