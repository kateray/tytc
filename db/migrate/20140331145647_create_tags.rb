class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.integer :link_id
      t.integer :language_id
      t.timestamps
    end
  end
end
