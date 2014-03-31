class CreateLanguages < ActiveRecord::Migration
  def change
    create_table :languages do |t|
      t.string :name
      t.integer :links_count
      t.timestamps
    end
  end
end
