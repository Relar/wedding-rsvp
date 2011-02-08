class AddAcceptedDisclaimerToFamily < ActiveRecord::Migration
  def self.up
    add_column :families, :accepted_disclaimer, :boolean
  end

  def self.down
    remove_column :families, :accepted_disclaimer
  end
end
