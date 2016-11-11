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
end
