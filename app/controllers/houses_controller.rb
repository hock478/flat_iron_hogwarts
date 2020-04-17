class HousesController < ApplicationController
    before_action :set_current_user
    def index
        @houses = House.all
    end

    def add_points
        # byebug
        house = House.find(params[:id])
        points = params[:house][:points].to_i
        # byebug
       
        house.points +=  points
        house.save
        
        redirect_to houses_path
    end

    def show
        if @current.house.id != params[:id].to_i
            redirect_to house_path(@current.house)
        elsif !@current
            redirect_to '/'
        else  
        @house = House.find(params[:id])
        @post = Post.new
        @comment = Comment.new
        @like = Like.new
        end
    end
    
    private

    def house_params
        params.require(:house).permit(:points)
    end
end
