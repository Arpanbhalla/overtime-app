@user = User.create(email: 'arpanbhalla@gmail.com', first_name: 'Arpan',
                   last_name: 'Bhalla', password: 'chicken',
                   password_confirmation: 'chicken', type: 'AdminUser')

100.times do |post|
  Post.create(date: Faker::Date.backward(100),
              rationale: Faker::Lorem.sentence, user_id: @user.id)
end

puts "#{Post.count} posts created"
