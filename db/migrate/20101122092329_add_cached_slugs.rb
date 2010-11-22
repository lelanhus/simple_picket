class AddCachedSlugs < ActiveRecord::Migration
  def self.up
    add_column :bricks,   :cached_slug, :string
    add_column :genders,  :cached_slug, :string
    add_column :species,  :cached_slug, :string
    add_column :states,   :cached_slug, :string
  end

  def self.down
    remove_column :bricks,  :cached_slug
    remove_column :genders, :cached_slug
    remove_column :species, :cached_slug
    remove_column :states,  :cached_slug
  end
end
