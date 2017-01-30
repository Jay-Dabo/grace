FactoryGirl.define do
  factory :user do
    sequence(:email){ |n| "user#{n}@example.com" }
    password "password"
    password_confirmation "password"
    confirmed_at Date.yesterday
  end

  factory :super_admin, parent: :user do
    after(:create){ |user| user.add_role("super_admin") }
  end

  factory :admin, parent: :user do
    after(:create){ |user| user.add_role("admin") }
  end

  factory :assistant, parent: :user do
    after(:create){ |user| user.add_role("assistant") }
  end
end
