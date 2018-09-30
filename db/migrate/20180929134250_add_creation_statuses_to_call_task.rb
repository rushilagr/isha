class AddCreationStatusesToCallTask < ActiveRecord::Migration[5.1]
  def change
    add_column :call_tasks, :participants_confirmed, :boolean, default: false
    add_column :call_tasks, :callers_confirmed, :boolean, default: false
  end
end
