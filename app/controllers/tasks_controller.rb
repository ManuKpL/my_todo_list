class TasksController < ApplicationController
  before_action :find_task, only: [:edit, :show, :update, :destroy, :done]

  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    params["task"]["done"] = false
    Task.create(task_params)
    redirect_to root_path
  end

  def edit
  end

  def update
    @task.update(task_params)
    @task.save
    redirect_to root_path
  end

  def done
    @task.done ? (@task.done = false) : (@task.done = true)
    @task.save
    redirect_to root_path
  end

  def destroy
    @task.destroy
    redirect_to root_path
  end

  private

  def task_params
    params.require(:task).permit(:name, :description, :done)
  end

  def find_task
    @task = Task.find(params[:id])
  end

end
