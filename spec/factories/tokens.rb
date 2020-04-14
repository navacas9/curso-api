FactoryGirl.define do
  factory :token do
    expires_at "2020-04-12 15:50:07"
    association :user, factory: :user
  end
end
