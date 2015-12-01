class ChangeUrlTobookmarklets5 < ActiveRecord::Migration
  def change
    create_table :bookmarklets do |t|
      t.text :bookmarkurl
      t.string :title
      t.string :icon
      t.references :user, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
