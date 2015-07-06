FactoryGirl.define do
  factory :user do
    name 'Sam'
    email 'sam@gmail.com'
    password '123'
    admin false
  end
end
