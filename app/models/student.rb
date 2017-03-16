class Student < ActiveRecord::Base
  def name
    lastname_initial = " #{lastname.first}." if has_repeated_firstname
    "#{firstname}#{lastname_initial}"
  end

  private
  
  def has_repeated_firstname
    table = Student.arel_table
    Student.where(table[:firstname].matches(firstname)).count > 1
  end
end
