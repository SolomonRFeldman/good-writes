class CreateGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :groups do |t|
      t.citext :name
      t.string :form
      t.integer :piece_id
      t.boolean :private
    end
  end
end
