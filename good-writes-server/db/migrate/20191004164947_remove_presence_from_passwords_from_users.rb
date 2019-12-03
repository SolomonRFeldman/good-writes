class RemovePresenceFromPasswordsFromUsers < ActiveRecord::Migration[6.0]
  def change
    change_column_null :users, :password_digest, true
  end
end
