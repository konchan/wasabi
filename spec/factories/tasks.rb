# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :task do
    name "MyString"
    detail "MyString"
    deadline "2012-09-07 13:44:51"
    started_at "2012-09-07"
    closed_at "2012-09-07 13:44:51"
  end
end
