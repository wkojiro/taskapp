class CreateBookmarklets < ActiveRecord::Migration
  def change
    create_table :bookmarklets do |t|
      t.string :url
      t.string :title
      t.string :icon
      t.references :user, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
