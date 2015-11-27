class ChangeIndexToBookmark < ActiveRecord::Migration
  def up
    change_table :bookmarklets do |t|
      t.references :project, index: true, foreign_key: true
    end
  end
  def down
    change_table  :bookmarklets do |t|
      t.references :user, index: true, foreign_key: true
    end
  end
end

