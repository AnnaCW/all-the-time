FactoryGirl.define do
  factory :user do
    email "testuser@gmail.com"
    password "password1"
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
    date "2016-11-12"
    description
  end
end
