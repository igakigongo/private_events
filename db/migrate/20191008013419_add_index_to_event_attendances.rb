class AddIndexToEventAttendances < ActiveRecord::Migration[5.2]
  def change
    add_index :event_attendances, [:event_id, :user_id], unique: true
  end
end
