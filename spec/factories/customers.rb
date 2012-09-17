# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :customer do
    code "MyString"
    name "MyString"
    address "MyString"
    url "MyString"
    counter 1
    description "MyString"
  end
end
