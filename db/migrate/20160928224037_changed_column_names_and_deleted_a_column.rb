class ChangedColumnNamesAndDeletedAColumn < ActiveRecord::Migration
  def change
    remove_column(:tasks, :completed?)
    rename_column(:tasks, :name, :title)
    rename_column(:tasks, :completion_date, :completed_at)
  end
end
