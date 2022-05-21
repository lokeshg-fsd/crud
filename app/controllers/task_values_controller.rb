# frozen_string_literal: true

class TaskValuesController < ApplicationController
  before_action :set_task_value, only: %i[show update destroy]

  # GET /task_values
  def index
    @task_values = TaskValue.all

    render json: @task_values
  end

  # GET /task_values/1
  def show
    render json: @task_value
  end

  # POST /task_values
  def create
    @task_value = TaskValue.new(task_value_params)

    if @task_value.save
      render json: @task_value, status: :created, location: @task_value
    else
      render json: @task_value.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /task_values/1
  def update
    if @task_value.update(task_value_params)
      render json: @task_value
    else
      render json: @task_value.errors, status: :unprocessable_entity
    end
  end

  # DELETE /task_values/1
  def destroy
    @task_value.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_task_value
    @task_value = TaskValue.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def task_value_params
    params.require(:task_value).permit(:tasks_id, :employees_id, :comment)
  end
end
