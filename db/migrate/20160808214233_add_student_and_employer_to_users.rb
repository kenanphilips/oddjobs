class AddStudentAndEmployerToUsers < ActiveRecord::Migration
  def change
    add_column :users, :employer, :boolean
    add_column :users, :student, :boolean
    add_column :users, :approved, :boolean
  end
end
