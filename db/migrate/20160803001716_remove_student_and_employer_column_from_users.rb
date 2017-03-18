class RemoveStudentAndEmployerColumnFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :student
    remove_column :users, :employer
  end
end
