class TasksController < ApplicationController
  def index
    @all_tasks = Task.all
  end

  def show
    @all_tasks = Task.find(params[:id])

    task_id = Integer( params[:id] )
    @task = @all_tasks[ task_id ]
  end

  def new
    Task.create
  end
end
