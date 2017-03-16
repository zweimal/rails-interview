class StudentsController < ApplicationController
  def index
    movie = student_params[:movie]
    @students = if movie.present?
        Student.where student_table[:favoritemovie].matches("%#{movie}%")
      else 
        Student.all
      end
  end

  private

  def student_params
    params.permit(:movie)
  end

  def student_table
    Student.arel_table
  end
end
