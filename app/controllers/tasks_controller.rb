class TasksController < ApplicationController

  def new
    @tasks = Task.new
  end

  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def create
    @task = Task.new(task_params)
    @task.save
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to index_path, status: :see_other
  end

  private

  def task_params
    params.require(:task).permit(:title, :details)
  end
end
