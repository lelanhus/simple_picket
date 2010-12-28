Factory.define :brick do |f|
  f.sequence(:name) { |n| Faker::Company.name + "#{n}" }
end 

Factory.define :state do |f|
  f.sequence(:name) { |n| Faker::Name.name + "#{n}" }
end

Factory.define :species do |f|
  f.sequence(:name) { |n| Faker::Name.name + "#{n}" }
end

Factory.define :gender do |f|
  f.sequence(:name) { |n| Faker::Name.name + "#{n}" }
end

Factory.define :relationship do |f|
  f.association :brick
  f.association :target, :factory => :brick
end

Factory.define :category do |f|
  f.sequence(:name) { |n| Faker::Name.name + "#{n}" }
end

Factory.define :brickization do |f|
  f.association :brick
  f.association :gender
  f.association :species
  f.association :state
  f.min 0.0
  f.max 10.0
  f.mean 5.0
  f.stdev 2.0
end

Factory.define :edge do |f|
  f.association :brickization
  f.association :target, :factory => :brickization
end

Factory.define :reference do |f|
  f.referenceable_type "Brickization"
  f.sequence(:referenceable_id) { |n| n.to_i }
  f.association :journal
end

Factory.define :journal do |f|
  f.sequence(:pubmed_id) { |n| n.to_i }
end