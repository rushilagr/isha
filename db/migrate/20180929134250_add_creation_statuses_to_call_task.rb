class AddCreationStatusesToCallTask < ActiveRecord::Migration[5.1]
  def change
    add_column :call_tasks, :participants_created, :boolean, default: false
    add_column :call_tasks, :callers_created, :boolean, default: false
  end
end
