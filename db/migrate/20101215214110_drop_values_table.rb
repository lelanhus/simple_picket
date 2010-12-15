class DropValuesTable < ActiveRecord::Migration
  def self.up
    drop_table :values
  end

  def self.down
  end
end
