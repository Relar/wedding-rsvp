class AddRsvpMessageToFamily < ActiveRecord::Migration
  def self.up
    add_column :families, :rsvp_message, :string, :limit => 1024
  end

  def self.down
    remove_column :families, :rsvp_message
  end
end
