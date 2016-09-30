class Task < ActiveRecord::Base
  def date_view
    @date_completed = created_at.strftime("%m/%d/%Y")
    return @date_completed
  end

  def task_completed?
    if completed_at != nil
      true
    else
      false
    end
  end

end
