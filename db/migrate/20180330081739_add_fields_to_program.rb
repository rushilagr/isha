class AddFieldsToProgram < ActiveRecord::Migration[5.1]
  def change
    add_column :programs, :central_id, :string
    add_column :programs, :type, :string
  end
end
