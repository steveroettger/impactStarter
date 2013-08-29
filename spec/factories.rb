FactoryGirl.define do
  factory :user do
    first_name 'Steve'
    last_name 'Roettger'
    sequence(:email) {|n| "steve-#{n}@example.com"}
    password 'password1'
    password_confirmation 'password1'
    provider 'linkedin'
  end

  factory :project do
    title 'Example Project'
    description 'This is an example of a project description.'
    association :owner, factory: :user
  end

  factory :invalid_project do
    title ''
    description ''
  end

  factory :organization do
    association :director, factory: :user
  end
end
