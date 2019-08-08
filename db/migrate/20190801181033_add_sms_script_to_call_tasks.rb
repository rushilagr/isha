class AddSmsScriptToCallTasks < ActiveRecord::Migration[5.1]
  def change
    add_column :call_tasks, :have_sms_script, :boolean
    add_column :call_tasks, :sms_script, :text
  end
end
