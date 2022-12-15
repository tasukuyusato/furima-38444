# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | -----------               |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| first_name_kana    | string | null: false               |
| last_name_kana     | string | null: false               |
| birthday           | date   | null: false               | 

has_many :items
has_many :comments
has_many :users_items 

## items テーブル

| Column                | Type       | Options     |
| ------                | ------     | ----------- |
| item_name             | string     | null: false |
| description           | text       | null: false |
| category_id           | integer    | null: false |
| status_id             | integer    | null: false |
| delivery_charge_id    | integer    | null: false |
| prifecture_id         | integer    | null: false |
| shipping_days_id      | integer    | null: false |
| price                 | integer    | null: false |
| user                  | references | null: false, foreign_key: true |


has_many :comment
has_one  :user_item
belongs_to :user


## users_items テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

belongs_to :item
belongs_to :user
has_one :pay

## pays テーブル

| Column            | Type       | Options                        |
| -------           | ---------- | ------------------------------ |                   
| post_code         | string     | null: false                    |
| prifecture_id     | integer    | null: false                    |
| city              | string     | null: false                    |
| address           | string     | null: false                    |
| building          | string     |                                |
| tel               | string     | null: false                    |
| item              | references | null: false, foreign_key: true |
| users_items       | references | null: false, foreign_key: true |

belongs_to : user_item 

## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| comment | text     |                                |
| user    | references | null: false, foreign_key: true |

belongs_to :item
belongs_to :user