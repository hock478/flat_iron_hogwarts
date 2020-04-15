class SubjectsController < ApplicationController
    before_action :set_current_user
    def show 
        @subject = Subject.find(params[:id])

    end

    def edit 

    end

    def new
        if !@current.professor || !@current
            redirect_to '/'
        end
       @subject = Subject.new
    end

    def create 

        @subject = Subject.new(subject_params)
        if @subject.valid?
            @subject.save
            redirect_to subject_path(@subject)
        else   
            render :new
        end

    end

    def update
        @subject = Subject.find(params[:id])
        @subject.update(subject_params)
        if @subject.valid?
            @subject.save
            redirect_to subject_path(@subject)
        else  
            render subject_path(@subject)
        end 
    end
    def update_courses
        @subject = Subject.find(params[:id])
        @enroll = Enrollment.create(subject: @subject, student_id: params[:subject][:student_ids])
        if @enroll.valid?
            @enroll.save
            redirect_to subject_path(@subject)
        else  
            render :show
        end

    end

    def destroy
        Subject.destroy(params[:id])
        redirect_to user_path(@current)
    end

    private

    def subject_params
        params.require(:subject).permit(:student_ids, :name, :professor_id)
    end
end
