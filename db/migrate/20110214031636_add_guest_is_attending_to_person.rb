class AddGuestIsAttendingToPerson < ActiveRecord::Migration
  def self.up
    add_column :people, :guest_is_attending, :boolean
  end

  def self.down
    remove_column :people, :guest_is_attending
  end
end
