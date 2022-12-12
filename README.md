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

## items テーブル

| Column                | Type       | Options     |
| ------                | ------     | ----------- |
| item_name             | text       | null: false |
| description           | text       | null: false |
| category              | string     | null: false |
| status                | string     | null: false |
| delivery_charge       | string     | null: false |
| sender                | string     | null: false |
| shipping_days         | string     | null: false |
| price                 | integer    | null: false |
| user                  | references | null: false, foreign_key: true |



has_many :comment
belongs_to :users


## user_item テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

belongs_to :items
belongs_to :tags

## pay テーブル

| Column     | Type       | Options                        |
| -------    | ---------- | ------------------------------ |
| creditcard | string     | null: false                    |
| expiry     | string     | null: false                    |
| code       | string     | null: false                    |
| post_code  | string     | null: false                    |
| prifecture | string     | null: false                    |
| city       | string     | null: false                    |
| address    | string     | null: false                    |
| building   | string     |                                |
| tel        | string     | null: false                    |
| item   | references | null: false, foreign_key: true |


belongs_to :items

## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| comment | text     |                                |
| user    | references | null: false, foreign_key: true |

belongs_to :items
belongs_to :users