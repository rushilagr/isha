class AddOnlineRegistrationCountToPrograms < ActiveRecord::Migration[5.1]
  def change
    add_column :programs, :online_registration_count, :integer
  end
end
