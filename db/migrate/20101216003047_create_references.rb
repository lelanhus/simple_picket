class CreateReferences < ActiveRecord::Migration
  def self.up
    create_table :references do |t|
      t.integer :referenceable_id
      t.string :referenceable_type
      t.integer :journal_id

      t.timestamps
    end
  end

  def self.down
    drop_table :references
  end
end
