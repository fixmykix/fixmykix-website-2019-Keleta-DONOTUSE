FactoryGirl.define do
  factory :product do
    title "MyString"
    description "This might be best product of all time"
    price "10"
    published false
    user
  end
end
