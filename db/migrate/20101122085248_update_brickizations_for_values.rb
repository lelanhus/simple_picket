class UpdateBrickizationsForValues < ActiveRecord::Migration
  def self.up
    add_column :brickizations, :min, :float
    add_column :brickizations, :max, :float
    add_column :brickizations, :mean, :float
    add_column :brickizations, :stdev, :float
  end

  def self.down
    remove_column :brickizations, :min
    remove_column :brickizations, :max
    remove_column :brickizations, :mean
    remove_column :brickizations, :stdev
  end
end
