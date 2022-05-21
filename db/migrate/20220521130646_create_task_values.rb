# frozen_string_literal: true

class CreateTaskValues < ActiveRecord::Migration[6.1]
  def change
    create_table :task_values do |t|
      t.references :tasks, null: false, foreign_key: true
      t.references :employees, null: false, foreign_key: true
      t.string :comment

      t.timestamps
    end
  end
end
