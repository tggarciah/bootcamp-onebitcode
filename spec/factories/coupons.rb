FactoryBot.define do
  factory :coupon do
    code { Faker::Commerce.unique.promotion_code(digits: 6) }
    status { %i(active inactive).sample }
    discount_value { rand(1.0..99.0).round(2) }
    due_date { Time.zone.now + 1.day }
  end
end
