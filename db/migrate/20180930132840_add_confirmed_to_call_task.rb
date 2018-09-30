class AddConfirmedToCallTask < ActiveRecord::Migration[5.1]
  def change
    add_column :call_tasks, :confirmed, :boolean, default: false
  end
end
