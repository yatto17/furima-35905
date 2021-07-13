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

## Association

has_many :items
has_many :orders


## items テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| name       | string     | null: false                    |
| info       | text       | null: false                    |
| price      | integer    | null: false                    |
| user       | references | null: false, foreign_key: true |
<!-- image → ActiveStorageで実装する -->

## Association

belongs_to :user
has_one :order


## orders テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| postal_code  | string     | null: false                    |
| city         | string     | null: false                    |
| addresses    | string     | null: false                    |
| phone_number | integer    | null: false                    |
| user         | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |
<!-- tokenはattr_accessorで追加する -->

## Association

belongs_to :user
belongs_to :item