class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :description, :text
    add_column :users, :age, :integer
    add_column :users, :city, :string
    add_column :users, :school, :string
    add_column :users, :experience, :text
    add_column :users, :phone_number, :string
  end
end
