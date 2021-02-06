# テーブル設計

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------  | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| first_name         | string  | null: false |
| last_name          | string  | null: false |
| kana_first_name    | string  | null: false |
| kana_last_name     | string  | null: false |
| birthday           | date    | null: false |


### Association

- has_many :items
- has_many :orders
- has_many :comments

## items テーブル

| Column            | Type        | Options                        |
| ----------------- | ----------  | -------------------------------|
| name        　　　 | string      | null: false                    |
| price        　　　| integer     | null: false                    |
| detail       　　　| text        | null: false                    |
| condition_id　　　 | integer     | null: false                    |
| shipping_fee_id   | integer     | null: false                    |
| shipment_place_id | integer     | null: false                    |
| shipment_date_id  | integer     | null: false                    |
| category_id       | integer     | null: false                    |
| user              | references  | null: false, foreign_key: true |


### Association

- has_many :comments
- belongs_to :user
- has_one :order

## orders テーブル

| Column     | Type        | Options                        |
| ---------- | ----------  | ------------------------------ |
| user       | references  | null: false, foreign_key: true |
| item       | references  | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## address テーブル

| Column            | Type        | Options                        |
| ----------------  | ----------  | ------------------------------ |
| post_code         | string      | null: false                    |
| shipment_place_id | integer     | null: false                    |
| city              | string      | null: false                    |    
| street_num        | string      | null: false                    |
| building          | string      |                                |
| tel_num           | string      | null: false                    |
| order             | references  | null: false, foreign_key: true |  

### Association

- belongs_to :order

## comments テーブル

| Column     | Type        | Options                        |
| ---------- | ----------  | ------------------------------ |
| text       | text        |                                |
| user       | references  | null: false, foreign_key: true |
| item       | references  | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
