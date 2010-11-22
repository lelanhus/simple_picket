class CreateBrickizations < ActiveRecord::Migration
  def self.up
    create_table :brickizations do |t|
      t.integer :brick_id
      t.integer :value_id

      t.timestamps
    end
  end

  def self.down
    drop_table :brickizations
  end
end
