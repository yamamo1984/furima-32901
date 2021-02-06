# テーブル設計

## users テーブル

| Column          | Type    | Options     |
| --------------- | ------  | ----------- |
| nickname        | string  | null: false |
| email           | string  | null: false |
| password        | string  | null: false |
| first_name      | string  | null: false |
| last_name       | string  | null: false |
| kana_first_name | string  | null: false |
| kana_last_name  | string  | null: false |
| birthday        | date    | null: false |


### Association

- has_many :items
- has_many :orders
- has_many :comments

## items テーブル

| Column            | Type        | Options                        |
| ----------------- | ----------  | -------------------------------|
| item_name         | string      | null: false                    |
| item_price        | integer     | null: false                    |
| item_condition_id | integer     | null: false                    |
| shipping_fee_id   | integer     | null: false                    |
| shipment_place_id | integer     | null: false                    |
| shipment_date_id  | integer     | null: false                    |
| category_id       | integer     | null: false                   |
| user_id           | references  | null: false, foreign_key: true |


### Association

- has_many :comments
- belongs_to :user
- has_one :order

## orders テーブル

| Column     | Type        | Options                        |
| ---------- | ----------  | ------------------------------ |
| card_num   | integer     | null: false                    |
| card_month | integer     | null: false                    |
| card_year  | integer     | null: false                    |    
| secu_code  | integer     | null: false                    |
| user_id    | references  | null: false, foreign_key: true |
| item_id    | references  | null: false, foreign_key: true |

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
| address_1         | string      | null: false                    |
| address_2         | string      | null: false                    |
| tel_num           | string      | null: false                    |
| order_id          | references  | null: false, foreign_key: true |  

### Association

- belongs_to :order

## comments テーブル

| Column     | Type        | Options                        |
| ---------- | ----------  | ------------------------------ |
| text       | text        |                                |
| user_id    | references  | null: false, foreign_key: true |
| item_id    | references  | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
