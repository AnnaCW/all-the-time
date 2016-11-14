FactoryGirl.define do
  factory :user do
    email "testuser@gmail.com"
    password "password1"
  end

  factory :organization do
    name "org"
  end

  factory :admin, class: User do
    email "admin@org.org"
    password "adminpwd"
    org_admin true
  end

  factory :category do
    name
  end

  sequence :name do |n|
    "name#{n}"
  end

  sequence :description do |n|
    "worked on task#{n}"
  end

  factory :entry do
    user
    category
    value 30
    date Date.today
    description
  end
end
