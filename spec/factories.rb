FactoryGirl.define do
  factory :user do
    # These are all methods:
    name 'Sam'
    email 'sam@gmail.com'
    password '123'
    admin false
  end

  factory :question do
    # user = FactoryGirl.create :user
    # user_id user.id
    heading 'Test question'
    content 'What do how why come?'
  end

  factory :question2, class: Question do
    # user = FactoryGirl.create :user
    # user_id user.id
    heading 'Wherefore?'
    content 'Whats the deal?!'
  end

  factory :answer do
    content 'Because I said do'
  end

end
