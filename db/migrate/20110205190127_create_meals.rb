class CreateMeals < ActiveRecord::Migration
  def self.up
    create_table :meals do |t|
      t.string :name
      t.float :price
      t.boolean :is_adult

      t.timestamps
    end
  end

  def self.down
    drop_table :meals
  end
end
