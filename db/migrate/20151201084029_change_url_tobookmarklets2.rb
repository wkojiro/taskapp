class ChangeUrlTobookmarklets2 < ActiveRecord::Migration
  def change
    # [形式] remove_column(テーブル名, カラム名)
    remove_column :bookmarklets, :url
    remove_column :bookmarklets, :project, index: true, foreign_key: true
  end
end