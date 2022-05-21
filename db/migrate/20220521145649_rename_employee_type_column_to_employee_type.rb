# frozen_string_literal: true

# RenameEmployeeTypeColumnToEmployeeType
class RenameEmployeeTypeColumnToEmployeeType < ActiveRecord::Migration[6.1]
  def change
    rename_column :employees, :type, :job_type
  end
end
