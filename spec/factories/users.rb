FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name}
    end

    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name             { person.last.kanji }#{Faker::Name.initials(number: 2)}
    first_name            { person.first.kanji }#{Faker::Name.initials(number: 2)}
    kana_last_name        { person.last.katakana }#{Faker::Name.initials(number: 2)}
    kana_first_name       { person.first.katakana}#{Faker::Name.initials(number: 2)}
    birthday              {Faker::Date.backward}

  end
end