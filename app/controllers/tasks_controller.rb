class TasksController < ApplicationController
  def index
    @all_tasks = [
      {id: 1, name: "Groceries", description: "apples, oranges, pasta, veggies", completion_status: "incomplete", completion_date: nil},
      {id: 2, name: "Appointment", description: "eye docotor on thursday", completion_status: "incomplete", completion_date: nil},
      {id:3, name: "call jane", description: "for her birthday", completion_status: "completed", completion_date: "9/25/16"},
      {id: 4, name: "oil change", description: "car needs one by end of month", completion_status: "incomplete", completion_date: nil}
    ]
  end

  def show
    @all_tasks = [
      {id: 1, name: "Groceries", description: "apples, oranges, pasta, veggies", completion_status: "incomplete", completion_date: nil},
      {id: 2, name: "Appointment", description: "eye docotor on thursday", completion_status: "incomplete", completion_date: nil},
      {id:3, name: "call jane", description: "for her birthday", completion_status: "completed", completion_date: "9/25/16"},
      {id: 4, name: "oil change", description: "car needs one by end of month", completion_status: "incomplete", completion_date: nil}
    ]

    task_id = Integer( params[:id] )

    @task = @all_tasks[ task_id-1 ]
  end
end
