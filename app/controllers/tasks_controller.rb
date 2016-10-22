class TasksController < ApplicationController
  before_action :find_task, only: [:show, :edit, :update, :destroy, :completed]

  def index
    @all_tasks = @current_user.tasks.by_date
  end


  def show; end


  def new
    @task = Task.new
  end


  def create
    @task = Task.new(task_params)
    @task.user_id = session[:user_id]

    if @task.save
      # saved successfully
      redirect_to tasks_path(@task)
    else
      # did not save
      render :new
    end
  end


  def edit
    # @task = Task.find(params[:id])

  end


  def update
    # @task = Task.find(params[:id])

    if @task.update(task_params)
      # saved successfully
      redirect_to tasks_path
    else
      # did not save
      render :edit
    end
  end


  def destroy
    # @task = Task.find(params[:id])

    @task.destroy
    redirect_to tasks_path
  end


  def completed
    # @task = Task.find(params[:id])

    if @task.completed_at == nil
      @task.completed_at = Date.today
      @task.save
      redirect_to tasks_path
    else
      redirect_to tasks_path
    end
  end


  private

  def task_params
    params.require(:task).permit(:title, :description, :completed_at)
  end

  def find_task
    begin
      @task = @current_user.tasks.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render file: "public/404", status: :not_found
    end
  end

end
