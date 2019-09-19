class AddUniquenessAndPresenceToUsers < ActiveRecord::Migration[6.0]
  def change
    enable_extension :citext
    
    change_column :users, :username, :citext
    change_column_null :users, :username, false

    change_column :users, :email, :citext
    change_column_null :users, :email, false
    add_index :users, :email, unique: true

    change_column_null :users, :password_digest, false
  end
end
