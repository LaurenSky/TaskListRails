class ChangedFromDateTimeToDate < ActiveRecord::Migration
  def change
    change_column(:tasks, :completed_at, :date)
  end
end
