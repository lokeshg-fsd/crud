# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_220_521_130_646) do # rubocop:disable Metrics/BlockLength
  create_table 'branches', charset: 'utf8mb4', force: :cascade do |t|
    t.string 'name'
    t.string 'address'
    t.string 'code'
    t.string 'state'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'employees', charset: 'utf8mb4', force: :cascade do |t|
    t.string 'first_name'
    t.string 'last_name'
    t.string 'email'
    t.string 'role'
    t.string 'type'
    t.bigint 'branches_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['branches_id'], name: 'index_employees_on_branches_id'
  end

  create_table 'task_values', charset: 'utf8mb4', force: :cascade do |t|
    t.bigint 'tasks_id', null: false
    t.bigint 'employees_id', null: false
    t.string 'comment'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['employees_id'], name: 'index_task_values_on_employees_id'
    t.index ['tasks_id'], name: 'index_task_values_on_tasks_id'
  end

  create_table 'tasks', charset: 'utf8mb4', force: :cascade do |t|
    t.string 'title'
    t.text 'description'
    t.string 'status'
    t.boolean 'is_completed'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'users', charset: 'utf8mb4', force: :cascade do |t|
    t.string 'first_name'
    t.string 'last_name'
    t.string 'email'
    t.boolean 'is_admin'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  add_foreign_key 'employees', 'branches', column: 'branches_id'
  add_foreign_key 'task_values', 'employees', column: 'employees_id'
  add_foreign_key 'task_values', 'tasks', column: 'tasks_id'
end
