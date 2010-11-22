class CreateBricks < ActiveRecord::Migration
  def self.up
    create_table :bricks do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :bricks
  end
end
