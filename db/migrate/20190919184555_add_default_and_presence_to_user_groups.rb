class AddDefaultAndPresenceToUserGroups < ActiveRecord::Migration[6.0]
  def change
    change_column_null :user_groups, :user_id, false
    change_column_null :user_groups, :group_id, false
    change_column_default :user_groups, :moderator_status, false
  end
end
