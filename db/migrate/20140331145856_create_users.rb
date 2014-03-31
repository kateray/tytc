class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.integer :github_id
      t.string :avatar_url
      t.boolean :god
      t.timestamps
    end
  end
end
