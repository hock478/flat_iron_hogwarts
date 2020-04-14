class EnrollmentsController < ApplicationController

    def destroy
        @enrollment = Enrollment.find(params[:id])
        @enrollment.delete
        redirect_to user_path(@current)
    end
end
