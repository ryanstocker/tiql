FactoryGirl.define do
  factory :user do
    email "admin@example.com"
    password "test"
    password_confirmation "test"
  end

  factory :site do
    endpoint "http://foo.example.com"
    frequency 5
    enabled true
  end
end
