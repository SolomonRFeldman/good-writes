class AddPieceIdToUserGroups < ActiveRecord::Migration[6.0]
  def change
    add_column :user_groups, :piece_id, :integer
  end
end
