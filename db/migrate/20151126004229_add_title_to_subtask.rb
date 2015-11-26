class AddTitleToSubtask < ActiveRecord::Migration
  def change
        add_column :users, :imageicon, :string
        add_column :users, :url, :string
        add_column :users, :screenname, :string
        add_column :subtasks, :description, :text
  end
end
