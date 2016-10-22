class Task < ActiveRecord::Base
  belongs_to :user

  validates :user_id, presence: true

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

  def self.by_date
    order(:created_at)
  end

end
