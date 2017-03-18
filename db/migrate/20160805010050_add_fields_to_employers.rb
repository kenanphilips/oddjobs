class AddFieldsToEmployers < ActiveRecord::Migration
  def change
    add_column :employers, :first_name,   :string
    add_column :employers, :last_name,    :string
    add_column :employers, :company,      :string
    add_column :employers, :address,      :string
    add_column :employers, :phone_number, :string
  end
end
