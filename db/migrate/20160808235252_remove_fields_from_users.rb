class RemoveFieldsFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :admin
    remove_column :users, :approved
  end
end
