FactoryGirl.define do
  sequence(:email) { |n| "info#{n}@example.com" }

  factory :user, class: ActivePortal::User do
    email { generate(:email) }
    password 'qwe12345'
    password_confirmation 'qwe12345'
  end
end
