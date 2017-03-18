class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.text :description
      t.string :age
      t.string :city
      t.string :school
      t.text :experience
      t.string :phone_number

      t.timestamps null: false
    end
  end
end
