class CreateUserGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :user_groups do |t|
      t.integer :user_id
      t.integer :group_id
      t.citext :alias
      t.boolean :moderator_status
    end
  end
end
