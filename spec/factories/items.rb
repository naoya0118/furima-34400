FactoryBot.define do
  factory :item do
    title              {Faker::Name.initials(number: 2)}
    explanation                 {Faker::Internet.free_email}
    price              { '1a' + Faker::Internet.password(min_length: 6) }
    category  {password}
    state             { person.last.kanji }
    delivery_fee            { person.first.kanji }
    delivery_area        { person.last.katakana }
    delivery_date       { person.first.katakana}
    
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end