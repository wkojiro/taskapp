class AddUseridToProjects < ActiveRecord::Migration
  def change
    add_reference :projects, :user, index: true, foreign_key: true
    add_index :projects,[:user_id, :created_at]
  end
end
