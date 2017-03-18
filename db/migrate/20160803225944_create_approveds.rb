class CreateApproveds < ActiveRecord::Migration
  def change
    create_table :approveds do |t|

      t.timestamps null: false
    end
  end
end
