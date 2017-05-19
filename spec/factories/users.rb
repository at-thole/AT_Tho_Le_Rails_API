FactoryGirl.define do
  factory :user do
    username {Faker::Name.first_name}
    password "asd123"
    email {Faker::Internet.free_email}
    phone "123123"
    address "asdsad 123"
  end
end
