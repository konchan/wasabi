# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :campaign do
    name "MyString"
    code "MyString"
    counter 1
    started_at "2012-09-03"
    closed_at "2012-09-03"
    amount "MyString"
    description "MyString"
  end
end
