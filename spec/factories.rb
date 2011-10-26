# This will guess the User class
FactoryGirl.define do
  factory :user do
    email 'foo@bar.de'
    password 'secretpassword'
  end
  factory :admin, :class => User do
    password 'secretpassword'
    email 't@c-base.org' # admin email adress    
  end
end
FactoryGirl.define do
  factory :submission do
    title "some submission title"
    description "some submission description"
    category
    platform
    user
  end
end
FactoryGirl.define do
  factory :category do
    name "category name"
  end
end
FactoryGirl.define do
<<<<<<< HEAD
  factory :page do
    name "page name"
    content "# Heading"
    permalink "permalink"
  end
end

FactoryGirl.define do
=======
>>>>>>> master
  factory :platform do
    name "platform name"
    description "some submission description"
    shortname "shortplatfrm"
  end
end
