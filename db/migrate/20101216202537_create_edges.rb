class CreateEdges < ActiveRecord::Migration
  def self.up
    create_table :edges do |t|
      t.integer :brickization_id
      t.integer :target_id
      t.text :note

      t.timestamps
    end
  end

  def self.down
    drop_table :edges
  end
end
