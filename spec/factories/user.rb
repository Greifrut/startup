FactoryBot.define do
  factory :user do 
    first_name "Foo"
    last_name "Bar"
    email "example@example.com"
    password "foobar12"
    password_confirmation "foobar12"
  end
end