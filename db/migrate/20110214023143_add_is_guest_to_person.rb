class AddIsGuestToPerson < ActiveRecord::Migration
  def self.up
    add_column :people, :is_guest, :boolean
  end

  def self.down
    remove_column :people, :is_guest
  end
end
