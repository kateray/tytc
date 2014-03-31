class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :title
      t.string :url
      t.text :description
      t.integer :user_id
      t.integer :votes_count
      t.integer :level
      t.boolean :free
      t.timestamps
    end
  end
end
