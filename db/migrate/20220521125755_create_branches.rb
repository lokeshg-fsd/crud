# frozen_string_literal: true

class CreateBranches < ActiveRecord::Migration[6.1]
  def change
    create_table :branches do |t|
      t.string :name
      t.string :address
      t.string :code
      t.string :state

      t.timestamps
    end
  end
end
