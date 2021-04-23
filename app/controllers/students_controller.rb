class StudentsController < ApplicationController
  before_action :set_student, only:[:show, :edit, :update, :destroy]
    before_action :authenticate_user!
    before_action :correct_user, only: [:edit,:update, :destroy]
    def index
      @students = current_user.students
    end
  
    def show
     
    end
  
    def new
      #@student = Student.new
      @student = current_user.students.build
    end
  
    def create
     # @student = Student.create(student_params)
     @student = current_user.students.build(student_params)
     respond_to do |format|
      if @student.save
        format.html { redirect_to @student, notice: 'Successfully created.' }
      else
        format.html { render :new }
      end
    end

    end
  
    def edit
      @student = Student.find(params[:id])
    end
  
    def update
      @student = Student.find(params[:id])
      @student.update(student_params)
      redirect_to student_path(@student)
    end

    def destroy
      @student = Student.find(params[:id]).destroy
      redirect_to students_url
    end
  def correct_user
    @student = current_user.students.find_by(id: params[:id])
    redirect_to students_path, notice: "Action not allowed" if @student.nil?
  end
    private
    def set_student 
      @student= Student.find(params[:id])
    end
    def student_params
      params.require(:student).permit(:first_name, :last_name,:email,:phone, :user_id)
    end

end
  