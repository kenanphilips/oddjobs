class RemoveEmployerFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :employer
  end
end
