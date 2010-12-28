class DropInfluenceshipsTable < ActiveRecord::Migration
  def self.up
    drop_table :influenceships
  end

  def self.down
    create_table :influenceships do |t|
      t.integer :brick_id
      t.integer :influence_id

      t.timestamps
    end
  end
end
