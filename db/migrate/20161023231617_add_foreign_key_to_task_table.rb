class AddForeignKeyToTaskTable < ActiveRecord::Migration
  def change
    add_foreign_key :tasks, :users
  end
end
