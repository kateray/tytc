class AddAuthorToLink < ActiveRecord::Migration
  def change
    add_column :links, :author, :string
  end
end
