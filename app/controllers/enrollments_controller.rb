class EnrollmentsController < ApplicationController
    before_action :set_current_user
    def destroy
        @enrollment = Enrollment.find(params[:id])
        @enrollment.delete
        redirect_to user_path(@current)
    end
end
