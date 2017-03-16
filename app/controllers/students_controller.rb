class StudentsController < ApplicationController

  before_action :load_students, only: :index

  def index
    if request.headers['Content-Type'] == 'application/json'
      respond_to :json
    else
      respond_to :html
    end
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
