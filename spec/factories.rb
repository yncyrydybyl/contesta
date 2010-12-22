# This will guess the User class
FactoryGirl.define do
  factory :user do
    email 'foo@bar.de'
    password 'secretpassword'
  end
end
