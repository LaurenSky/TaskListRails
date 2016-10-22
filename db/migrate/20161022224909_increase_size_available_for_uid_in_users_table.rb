class IncreaseSizeAvailableForUidInUsersTable < ActiveRecord::Migration
  def change
    change_column :users, :uid, :integer, limit: 9
  end
end
