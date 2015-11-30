class ChangeIndexToBookmark < ActiveRecord::Migration
  def up
    change_table :bookmarklets do |t|
      t.text :url
    end
  end
  def down
    change_table  :bookmarklets do |t|
      t.string :url
    end
  end
end

