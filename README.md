# テーブル設計

## users テーブル

| Column         | Type    | Options      |
| ---------------| --------| -------------|
| nickname       | string  | null: false, |
| email          | string  | null: false, |
| password       | string  | null: false, |
| firstname      | string  | null: false, |
| lastname       | string  | null: false, |
| cana_firstname | string  | null: false, |
| cana_lastname  | string  | null: false, |
| birthday       | integer | null: false, |

### Association
- has_many :items
- has_many :consumers

## items テーブル

| Column      | Type    | Options      |
| ------------| --------| -------------|
| name        | string  | null: false, |
| explation   | text    | null: false, |
| image       | string  | null: false, |
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
| postalcode  | string  | null: false, |
| pref_id     | integer | null: false, |
| city        | string  | null: false, |
| address     | string  | null: false, |
| buldname    | integer |              |
| tel         | string  | null: false, |
| user_id     | integer | null: false, |
| item_id     | integer | null: false, |

### Association
- belongs_to :users
- belongs_to :consumers


## users_items テーブル

| Column      | Type    | Options      |
| ------------| --------| -------------|
| user_id     | integer | null: false, |
| item_id     | integer | null: false, |

### Association
- belongs_to :users
- belongs_to :items