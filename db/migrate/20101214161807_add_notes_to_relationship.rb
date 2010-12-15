class AddNotesToRelationship < ActiveRecord::Migration
  def self.up
    add_column :relationships, :note, :text
  end

  def self.down
    remove_column :relationships, :note
  end
end
