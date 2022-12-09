# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| first_name         | string | null: false |
| last_name          | string | null: false |
| first_name_kana    | string | null: false |
| last_name_kana     | string | null: false |
| birthday           | string | null: false | 


## items テーブル

| Column                | Type   | Options     |
| ------                | ------ | ----------- |
| item_name             | string | null: false |
| description of item   | string | null: false |
| price                 | string | null: false |


## item_tag テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| item   | references | null: false, foreign_key: true |
| tag   | references  | null: false, foreign_key: true |

## tags テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| category           | string | null: false |
| delivery charge    | string | null: false |
| status             | string | null: false |
| delivery charge    | string | null: false |
| sender             | string | null: false |
| shipping days      | string | null: false |
| price              | string | null: false |

## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| comment | string     |                                |
| user    | references | null: false, foreign_key: true |