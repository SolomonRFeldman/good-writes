class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.integer :user_id, null: false
      t.integer :piece_id, null: false
      t.integer :group_id
      t.string :content, null: false
      t.timestamps
    end
  end
end
