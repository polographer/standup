FactoryGirl.define do
  sequence :user_email do |i|
    "test_user_#{i}@example.com"
  end
end

FactoryGirl.define do
  factory :user do
    email { FactoryGirl.generate :user_email }
    password 'abc123'
    password_confirmation 'abc123'
  end
end
