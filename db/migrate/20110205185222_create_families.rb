class CreateFamilies < ActiveRecord::Migration
  def self.up
    create_table :families do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :street_address

      t.timestamps
    end
  end

  def self.down
    drop_table :families
  end
end
