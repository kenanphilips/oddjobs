class DropApproveds < ActiveRecord::Migration
  def change
    drop_table :approveds
  end
end
