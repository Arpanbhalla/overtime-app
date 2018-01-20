FactoryGirl.define do
  factory :post do
    date            { Faker::Date.backward(14) }
    rationale       'Some Rationale'
    user
  end

  factory :second_post, class: 'Post' do
    date            { Faker::Date.backward(10)}
    rationale       'Some more content'
    user
  end
end
