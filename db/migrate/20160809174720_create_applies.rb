class CreateApplies < ActiveRecord::Migration
  def change
    create_table :applies do |t|
      t.references :user, index: true, foreign_key: true
      t.references :job, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
