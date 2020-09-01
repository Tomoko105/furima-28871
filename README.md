# テーブル設計

## users テーブル

| Column      | Type    | Options      |
| ------------| --------| -------------|
| nickname    | string  | null: false, |
| email       | string  | null: false, |
| password    | string  | null: false, |
| name        | string  | null: false, |
| cananame    | string  | null: false, |
| year_id     | integer | null: false, |
| month_id    | integer | null: false, |
| birthday_id | integer | null: false, |

### Association
- has_many :items
- has_many :consumers

## items テーブル

| Column      | Type    | Options      |
| ------------| --------| -------------|
| itemname    | string  | null: false, |
| itemexp     | text    | null: false, |
| itemimg     | string  | null: false, |
| price       | integer | null: false, |
| fee         | integer | null: false, |
| profit      | integer | null: false, |
| category_id | integer | null: false, |
| status_id   | integer | null: false, |
| user_id     | integer | null: false, |

### Association
- belongs_to :users
- has_one :consumers

## consumers テーブル

| Column      | Type    | Options      |
| ------------| --------| -------------|
| postalcode  | integer | null: false, |
| pref_id     | integer | null: false, |
| city        | string  | null: false, |
| address     | string  | null: false, |
| buldname    | integer | |
| tel         | integer | null: false, |
| user_id     | integer | null: false, |
| item_id     | integer | null: false, |

### Association
- belongs_to :users
- belongs_to :consumers

