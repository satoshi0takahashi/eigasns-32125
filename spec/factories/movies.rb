FactoryBot.define do
  factory :movie do
    name { Faker::Name.initials(number: 2) }
    detail { Faker::Lorem.sentence }
    category_id { Faker::Number.between(from: 2, to: 11) }
    country_id { Faker::Number.between(from: 2, to: 5) }
    release_date_id { Faker::Number.between(from: 2, to: 123) }

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/bttf.jpg'), filename: 'bttf.jpg')
    end
  end
end
