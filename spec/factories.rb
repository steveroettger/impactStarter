FactoryGirl.define do
  factory :user do
    first_name 'Steve'
    last_name 'Roettger'
    email 'steve@steveroettger.com'
    password 'secret'
    password_confirmation 'secret'
    provider 'linkedin'
  end
  
  factory :project do
    title 'Example Project'
    description 'This is an example of a project description.'
  end
  
  factory :invalid_project do
    title ''
    description ''
  end
end