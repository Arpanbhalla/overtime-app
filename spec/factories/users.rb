FactoryGirl.define do

  sequence :email do |n|
    "test#{n}@example.com"
  end
  factory :user do
    email { generate :email }
    first_name 'John'
    last_name 'Doe'
    password 'chicken'
    password_confirmation 'chicken'
  end

  factory :admin_user, class: 'AdminUser' do
    email { generate :email }
    first_name 'Admin'
    last_name 'User'
    password 'chicken'
    password_confirmation 'chicken'
  end
end
