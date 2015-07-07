FactoryGirl.define do
  factory :user do
    name 'Sam'
    email 'sam@gmail.com'
    password '123'
    admin false
  end

  factory :question do
    heading 'Test question'
    content 'What do how why come?'
  end

  factory :answer do
    content 'Because I said do'
  end

end
