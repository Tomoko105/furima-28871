FactoryBot.define do
  factory :user do
    nickname { Faker::Name.last_name }
    # nickname {"aaaaa"}
    email { Faker::Internet.free_email }
    # email {"abc@imail.com"}
    password { Faker::Internet.password(max_length: 6) }
    # password{"aaa111"}
    password_confirmation { password }
    firstname { '山田' }
    lastname { '太郎' }
    kana_firstname { 'ヤマダ' }
    kana_lastname { 'タロウ' }
    birthday { Faker::Date.birthday }
  end
end
