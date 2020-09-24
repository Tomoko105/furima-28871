FactoryBot.define do
  factory :consumer_user_item do
    postalcode { '123-4567' }
    pref_id { 2 }
    city { '横浜市緑区' }
    address { '青山1-1-1' }
    buldname { '柳ビル103' }
    tel { '09012345678' }
    token {'aaaabbbbccccc11127784'}
  end
end