class AddUserIdToOutsideTracker < ActiveRecord::Migration[8.0]
  def change
    add_column :outside_trackers, :user_id, :integer
    add_index :outside_trackers, :user_id
  end
end
