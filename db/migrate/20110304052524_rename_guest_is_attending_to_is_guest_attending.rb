class RenameGuestIsAttendingToIsGuestAttending < ActiveRecord::Migration
  def self.up
    rename_column :people, :guest_is_attending, :is_guest_attending
  end

  def self.down
    rename_column :people, :is_guest_attending, :guest_is_attending
  end
end
