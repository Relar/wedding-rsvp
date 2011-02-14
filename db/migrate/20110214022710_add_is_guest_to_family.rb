class AddIsGuestToFamily < ActiveRecord::Migration
  def self.up
    add_column :families, :is_guest, :boolean
  end

  def self.down
    remove_column :families, :is_guest
  end
end
