class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :title
      t.text :description
      t.text :requirements
      t.string :dates
      t.string :address
      t.float :wage

      t.timestamps null: false
    end
  end
end
