class AddScriptToCallTask < ActiveRecord::Migration[5.1]
  def change
    add_column :call_tasks, :script, :text
  end
end
