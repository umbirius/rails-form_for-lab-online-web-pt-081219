class SchoolClassesController < ApplicationController

    def create 
        @school_class = SchoolClass.new(school_class_params(:title, :room_number))
        if @school_class.save
            redirect_to school_class_path(@school_class)
        else
            render new 
        end 
    end

    def new
        @school_class = SchoolClass.new
    end 

    def show
        @school_class = SchoolClass.find(params[:id])
    end 

    def edit 
        @school_class = SchoolClass.find(params[:id])
    end 

    def update
        @school_class = SchoolClass.find(params[:id])
        if @school_class.update(school_class_params(:title, :room_number))
            redirect_to school_class_path(@school_class)
        else
            render edit
        end 
    end 

    def school_class_params(*args)
        params.require(:school_class).permit(*args)
    end
end