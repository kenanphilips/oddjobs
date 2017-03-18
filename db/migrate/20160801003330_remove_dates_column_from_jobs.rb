class RemoveDatesColumnFromJobs < ActiveRecord::Migration
  def change
    remove_column :jobs, :dates
  end
end
