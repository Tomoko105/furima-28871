# テーブル設計

## users テーブル

| Column         | Type    | Options      |
| ---------------| --------| -------------|
| nickname       | string  | null: false, |
| email          | string  | null: false, |
| password       | string  | null: false, |
| firstname      | string  | null: false, |
| lastname       | string  | null: false, |
| kana_firstname | string  | null: false, |
| kana_lastname  | string  | null: false, |
| birthday       | date    | null: false, |

### Association
- has_many :users_items
- has_many :items

## items テーブル

| Column      | Type       | Options                        |
| ------------| -----------| -------------------------------|
| name        | string     | null: false,                   |
| explation   | text       | null: false,                   |
| price       | integer    | null: false,                   |
| fee         | integer    | null: false,                   |
| category_id | integer    | null: false,                   |
| status_id   | integer    | null: false,                   |
| pref_id     | integer    | null: false,                   |
| ship_id     | integer    | null: false,                   |
| user        | references | null: false, foreign_key: true |

### Association
- has_one :users_items
- has_one : user,through:users_items


## consumers テーブル

| Column      | Type       | Options                        |
| ------------| -----------| -------------------------------|
| postalcode  | string     | null: false,                   |
| pref_id     | integer    | null: false,                   |
| city        | string     | null: false,                   |
| address     | string     | null: false,                   |
| buldname    | string     |                                |
| tel         | string     | null: false,                   |
| users_item  | references | null: false, foreign_key: true |


### Association
- belongs_to:users_items


## users_items テーブル

| Column      | Type       | Options                        |
| ------------| -----------| -------------------------------|
| user        | references | null: false, foreign_key: true |
| item        | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one : consumer