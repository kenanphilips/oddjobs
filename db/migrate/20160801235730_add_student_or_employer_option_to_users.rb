class AddStudentOrEmployerOptionToUsers < ActiveRecord::Migration
  def change
    add_column :users, :student, :boolean
    add_column :users, :employer, :boolean
  end
end
