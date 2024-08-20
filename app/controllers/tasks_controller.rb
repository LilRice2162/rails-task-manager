class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def onetask
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  # def create
  #   @task = Tasks.new(params[:tasks])
  #   @task.save # Will raise ActiveModel::ForbiddenAttributesError
  # end

  def create
    @task = Task.new(task_params)
    @task.save
    # No need for app/views/tasks/create.html.erb
    redirect_to task_path(@task)
  end

  def edit
    @task = Task.find(params[:id])
  end

  # def update
  #   @task = Task.find(params[:id])
  #   @task.update(params[:task]) # Will raise ActiveModel::ForbiddenAttributesError
  # end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    # No need for app/views/tasks/update.html.erb
    redirect_to task_path(@task)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    # No need for app/views/tasks/destroy.html.erb
    redirect_to tasks_path()
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
