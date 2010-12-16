class AddNoteAndDescToCategoryStuff < ActiveRecord::Migration
  def self.up
    add_column :categories, :description, :text
    add_column :categorizations, :note, :text
  end

  def self.down
    remove_column :categories, :description
    remove_column :categorizations, :note
  end
end
