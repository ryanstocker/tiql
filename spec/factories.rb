FactoryGirl.define do
  factory :user do
    email "admin@example.com"
    password "test"
    password_confirmation "test"
  end
end
