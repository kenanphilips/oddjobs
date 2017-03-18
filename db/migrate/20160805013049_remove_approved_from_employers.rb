class RemoveApprovedFromEmployers < ActiveRecord::Migration
  def change
    remove_column :employers, :approved
  end
end
