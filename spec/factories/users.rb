FactoryBot.define do
  factory :user do
    nickname              {"タナタロ"}
    email                 {Faker::Internet.free_email}
    password              {"111aaa"}
    password_confirmation {password}
    last_name             {"田中"}
    first_name            {"太郎"}
    kana_last_name        {"タナカ"}
    kana_first_name       {"タロウ"}
    birthday              {Faker::Date.birthday}
  end
end
