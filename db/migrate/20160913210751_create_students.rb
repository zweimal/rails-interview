class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :firstname
      t.string :lastname
      t.string :favoritefood
      t.string :favoritecolor
      t.string :favoritemovie

      t.timestamps null: false
    end
  end
end
