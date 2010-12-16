# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
require 'hpricot'

Gender.create([{ :name => "Male" }, { :name => "Female" }])
Species.create([{ :name => "Human" }, { :name => "Mouse" }])
State.create([{ :name => "Normal" }, { :name => "HumMod" }])

file = File.expand_path("../../lib/seed_data.xml", __FILE__)
xml = File.read(file)
doc = Hpricot.parse(xml)
state = State.find_by_name("HumMod")
gender = Gender.find_by_name("Male")
species = Species.find_by_name("Human")

(doc/:var).each do |xml_brick|
  brick = Brick.create(:name => (xml_brick/:name).innerHTML)
  note = "HumMod Variable Name: #{(xml_brick/:name).innerHTML}"
  brick.brickizations.create(:species_id => species.id, :gender_id => gender.id, :state_id => state.id, :mean => (xml_brick/:val).innerHTML, :note => note)
end