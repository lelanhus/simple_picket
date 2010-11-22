class AddNewKeysToBrickizations < ActiveRecord::Migration
  def self.up
    add_column :brickizations, :state_id, :integer
    add_column :brickizations, :species_id, :integer
    add_column :brickizations, :gender_id, :integer
  end

  def self.down
    remove_column :brickizations, :state_id
    remove_column :brickizations, :species_id
    remove_column :brickizations, :gender_id
  end
end
