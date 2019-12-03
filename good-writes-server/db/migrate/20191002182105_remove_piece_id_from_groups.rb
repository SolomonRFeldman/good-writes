class RemovePieceIdFromGroups < ActiveRecord::Migration[6.0]
  def change
    remove_column :groups, :piece_id, :integer
  end
end
