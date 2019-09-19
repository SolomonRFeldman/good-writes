class CreatePieces < ActiveRecord::Migration[6.0]
  def change
    create_table :pieces do |t|
      t.integer :user_id
      t.citext :title, null: false
      t.string :content, null: false
      t.string :form, null: false
      t.string :genre
    end
  end
end
