class AddNoteToBrickizations < ActiveRecord::Migration
  def self.up
    add_column :brickizations, :note, :text
  end

  def self.down
    remove_column :brickizations, :note
  end
end
