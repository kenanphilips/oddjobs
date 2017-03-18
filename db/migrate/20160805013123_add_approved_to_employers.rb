class AddApprovedToEmployers < ActiveRecord::Migration
  def change
    add_column :employers, :approved, :boolean, default: false
    add_column :employers, :admin, :boolean, default: false
  end
end
