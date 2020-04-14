class SubjectsController < ApplicationController
    before_action :set_current_user
    def show 
        @subject = Subject.find(params[:id])

    end

    def edit 

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

    private

    def subject_params
        params.require(:subject).permit(:student_ids)
    end
end
