class EnrollmentsController < ApplicationController
    before_action :set_current_user
    
    def destroy
        @enrollment = Enrollment.find(params[:id])
        @subject = @enrollment.subject
        @enrollment.delete
        redirect_to subject_path(@subject)
    end

    def destroy_student
        @enrollment = Enrollment.find(params[:id])
        
        @enrollment.delete
        redirect_to student_edit_subjects_path(@current)
    end
end
