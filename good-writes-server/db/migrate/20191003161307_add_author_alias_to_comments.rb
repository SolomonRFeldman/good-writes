class AddAuthorAliasToComments < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :author_alias, :string
  end
end
