class AddTimestampsToPiecesGroupsAndUserGroups < ActiveRecord::Migration[6.0]
  def change
    add_timestamps :pieces, null: false
    add_timestamps :groups, null: false
    add_timestamps :user_groups, null: false
  end
end
