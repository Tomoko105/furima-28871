FactoryBot.define do
  factory :item do
    # image{}
    name { '商品名' }
    explation { '商品の説明です' }
    price { '1000' }
    category_id { 2 }
    status_id { 2 }
    burden_id { 2 }
    pref_id { 2 }
    ship_id { 2 }
  end
end
