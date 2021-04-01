# テーブル設計

## usersテーブル

| column             | Type      | Options                 |
| ------------------ | --------- | ----------------------- |
| nickname           | string    | null:false              |
| email              | string    | null:false, unique:true |
| encrypted_password | string    | null:false              |
| last_name          | string    | null:false              |
| first_name         | string    | null:false              |
| kana_last_name     | string    | null:false              |
| kana_first_name    | string    | null:false              |
| birthday           | date      | null:false              |

### Association

- has_many :products
- has_many :records


## productsテーブル

| column          | Type       | Options                       |
| --------------- | ---------- | ----------------------------- |
| name            | string     | null:false                    |
| content         | text       | null:false                    |
| price           | integer    | null:false                    |
| category_id     | integer    | null:false                    |
| status_id       | integer    | null:false                    |
| delivery_fee_id | integer    | null:false                    |
| prefecture_id   | integer    | null:false                    |
| arrival_date_id | integer    | null:false                    |
| user            | references | null:false, foreign_key: true |
 
 ### Association

 - belongs_to :user
 - has_one    :record


 ## addressesテーブル

| column        | Type       | Options                       |
| ------------- | ---------- | ----------------------------- |
| post_code     | string     | null:false                    |
| prefecture_id | integer    | null:false                    |
| city          | string     | null:false                    |
| house_number  | string     | null:false                    |
| building_name | string     |                               |
| phone_number  | string     | null:false                    |
| record        | references | null:false, foreign_key: true |

### Association

- belongs_to :record


## recordsテーブル

| column    | Type       | Options                       |
| --------- | ---------- | ----------------------------- |
| user      | references | null:false, foreign_key: true |
| product   | references | null:false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :product
- has_one    :record