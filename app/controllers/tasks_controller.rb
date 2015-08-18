class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def create
    params["task"]["done"] = false
    Task.create(task_params)
    redirect_to root_path
  end

  def new
    @task = Task.new
  end

  def edit
  end

  def show
    @task = Task.find(params[:id])
  end

  def update
  end

  def destroy
  end

  private

  def task_params
    params.require(:task).permit(:name, :description, :done)
  end

end
