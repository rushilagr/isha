class AddDndToParticipant < ActiveRecord::Migration[5.1]
  def change
    add_reference :participants, :dnd_marker, null: true
    add_column :participants, :dnd_reason, :string, null: true
    
    add_foreign_key :participants, :users, column: :dnd_marker_id, primary_key: :id
  end
end
