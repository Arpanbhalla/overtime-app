100.times do |post|
  Post.create(date: Faker::Date.backward(100),
              rationale: Faker::Lorem.sentence)
end

puts "#{Post.count} posts created"
