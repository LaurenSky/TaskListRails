class TasksController < ApplicationController
  def index
    @all_tasks = [
      {name: "Groceries", description: "apples, oranges, pasta, veggies", completion_status: "incomplete", completion_date: nil},
      {name: "Appointment", description: "eye docotor on thursday", completion_status: "incomplete", completion_date: nil},
      {name: "call jane", description: "for her birthday", completion_status: "completed", completion_date: "9/25/16"},
      {name: "oil change", description: "car needs one by end of month", completion_status: "incomplete", completion_date: nil}
    ]
  end

  def show
  end
end
