class CoursesController < ApplicationController
   
    def index
      
    end
  
    def show
      @course =Course.find(params[:id])
    end
  
    def new
      @course = Course.new
    end
  
    def create
      @course = Course.create(course_params)
      redirect_to course_path(@course)
    end
  
    def edit
      @course = Course.find(params[:id])
    end
  
    def update
      @course = Course.find(params[:id])
      @course.update(course_params)
      redirect_to course_path(@course)
    end
  
    private
    def course_params
      params.require(:course).permit(:name)
    end
  end