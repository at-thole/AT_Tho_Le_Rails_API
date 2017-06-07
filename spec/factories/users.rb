FactoryGirl.define do
  factory :user do
    username {Faker::Name.first_name}
    email {Faker::Internet.free_email}
    avatar '/uploads/user/avatar/avatar_default.png'
    password "123123"
    phone {Faker::Number.number(9)}
    address "asdsad 123"
    about_me "my name is ..."
  end
end
