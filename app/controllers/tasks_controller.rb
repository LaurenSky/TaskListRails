class TasksController < ApplicationController
  def index
    @all_tasks = Task.all
  end


  def show
    @task = Task.find(params[:id])

    # @task = Integer( params[:id] )
    # # @task = @all_tasks[ task_id ]
  end


  def new
    @task = Task.new
  end


  def create
    @task = Task.new(task_params)

    if @task.save
      # saved successfully
      redirect_to tasks_path
    else
      # did not save
      render :new
    end
  end


  def edit
    @task = Task.find(params[:id])

  end


  def update
    @task = Task.find(params[:id])

    if @task.update(task_params)
      # saved successfully
      redirect_to tasks_path
    else
      # did not save
      render :edit
    end
  end


  def delete
    @task = Task.find(params[:id])
  end


  def destroy
    @task = Task.find(params[:id])

    @task.destroy
    redirect_to tasks_path

  end


  private

    def task_params
      params.require(:task).permit(:title, :description, :completed_at)
    end

end
