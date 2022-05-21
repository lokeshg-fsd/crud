class CreateEmployees < ActiveRecord::Migration[6.1]
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :role
      t.string :type
      t.references :branches, null: false, foreign_key: true

      t.timestamps
    end
  end
end
