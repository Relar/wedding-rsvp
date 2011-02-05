class CreatePeople < ActiveRecord::Migration
  def self.up
    create_table :people do |t|
      t.integer :family_id
      t.string :first_name
      t.string :last_name
      t.boolean :is_invited_ceremony
      t.boolean :is_attending_ceremony
      t.boolean :is_attending_reception
      t.boolean :is_adult
      t.integer :meal_id

      t.timestamps
    end
  end

  def self.down
    drop_table :people
  end
end
