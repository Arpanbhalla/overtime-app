@user = User.create(email: 'abc@example.com', first_name: 'John',
                   last_name: 'Doe', password: 'chicken',
                   password_confirmation: 'chicken')

100.times do |post|
  Post.create(date: Faker::Date.backward(100),
              rationale: Faker::Lorem.sentence, user_id: @user.id)
end

puts "#{Post.count} posts created"
