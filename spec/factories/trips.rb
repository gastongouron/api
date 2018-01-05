FactoryGirl.define do
  factory :trip do
    title { FFaker::Lorem.word }
    from_city { FFaker::Address.city }
    to_city { FFaker::Address.city }
    start_date DateTime.now.utc.beginning_of_day
    end_date DateTime.now.utc.end_of_day
    price { rand() * 100 }
    published false
    user
  end
end
