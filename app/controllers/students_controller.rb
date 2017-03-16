class StudentsController < ApplicationController

  before_action :load_students, only: :index

  def index
    respond_to :html, :json
  end

  def js
  end

  private

  def load_students
    movie = student_params[:movie]
    @students = if movie.present?
        Student.where student_table[:favoritemovie].matches("%#{movie}%")
      else 
        Student.all
      end
  end

  def student_params
    params.permit(:movie)
  end

  def student_table
    Student.arel_table
  end
end
