class StudentsController < ApplicationController

  before_action :load_students, only: :index

  def index
    respond_to :html, :json
  end

  def js
  end

  private

  def load_students
    @students = Student.where student_filters
  end

  def student_filters
    filters = student_params.collect { |key, value| student_table["favorite#{key}"].matches("%#{value}%") }
    filters.inject :and
  end

  def student_params
    params.permit(:movie, :food, :color)
  end

  def student_table
    Student.arel_table
  end
end
