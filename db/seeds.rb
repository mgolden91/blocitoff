require "random_data"


5.times do
  Item.create!(
  name: RandomData.random_sentence
  )
end
items = Item.all
puts "seed finished"
puts "#{Item.count} items created"
