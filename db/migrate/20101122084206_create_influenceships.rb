class CreateInfluenceships < ActiveRecord::Migration
  def self.up
    create_table :influenceships do |t|
      t.integer :brick_id
      t.integer :influence_id

      t.timestamps
    end
  end

  def self.down
    drop_table :influenceships
  end
end
