class ChangeUrlTobookmarklets < ActiveRecord::Migration
  def up
    change_table :bookmarklets do |t|
      t.text :bookmarkurl
    end
  end
  def down
    change_table  :bookmarklets do |t|
      t.text :url
    end
  end
end

