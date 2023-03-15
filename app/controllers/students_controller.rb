class StudentsController < ApplicationController

  def index
    students = 
      if params[:query].present?
        Student.where('first_name ILIKE ? OR last_name ILIKE ?', "%#{params[:query]}%", "%#{params[:query]}%")
      else
        Student.all
      end
    render json: students
  end

  def show
    student = Student.find_by(id: params[:id])
    render json: student
  end

end
