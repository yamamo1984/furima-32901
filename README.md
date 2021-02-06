# テーブル設計

## users テーブル

| Column          | Type    | Options     |
| --------------- | ------  | ----------- |
| nickname        | string  | null: false |
| first_name      | string  | null: false |
| last_name       | string  | null: false |
| kana_first_name | string  | null: false |
| kana_last_name  | string  | null: false |
| birth_yeah      | integer | null: false |
| birth_month     | integer | null: false |
| birth_day       | integer | null: false |

### Association

- has_many :items
- has_many :orders
- has_many :comments

## items テーブル

| Column          | Type        | Options                        |
| --------------- | ----------  | -------------------------------|
| item_name       | string      | null: false                    |
| item_condition  | string      | null: false                    |
| shipping_fee    | string      | null: false                    |
| shipment_place  | string      | null: false                    |
| shipment_date   | string      | null: false                    |
| user_id         | references  | null: false, foreign_key: true |
| category_id     | references  | null: false, foreign_key: true |

### Association

- has_many :comments
- belongs_to :user
- belongs_to :category
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

| Column     | Type        | Options                        |
| ---------- | ----------  | ------------------------------ |
| post_num   | integer     | null: false                    |
| prefecture | integer     | null: false                    |
| city       | integer     | null: false                    |    
| address_1  | integer     | null: false                    |
| address_2  | references  | null: false                    |
| address_3  | references  |                                |
| tel_num    | integer     | null: false                    |
| order_id   | references  | null: false, foreign_key: true |  

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

## categories テーブル

| Column     | Type        | Options                        |
| ---------- | ----------  | ------------------------------ |
| name       | string      | null: false                    |
| item_id    | references  | null: false, foreign_key: true |

### Association

- has_many :items