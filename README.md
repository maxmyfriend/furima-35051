# テーブル設計

## usersテーブル

| column          | Type      | Options    |
| --------------- | --------- | ---------- |
| nickname        | string    | null:false |
| email           | string    | null:false |
| password        | string    | null:false |
| last_name       | string    | null:false |
| first_name      | string    | null:false |
| kana_last_name  | string    | null:false |
| kana_first_name | string    | null:false |
| birthday        | date      | null:false |

### Association

- has_many :products
- has_many :records


## productsテーブル

| column       | Type       | Options                       |
| ------------ | ---------- | ----------------------------- |
| name         | string     | null:false                    |
| content      | text       | null:false                    |
| category     | string     | null:false                    |
| status       | string     | null:false                    |
| delivery_fee | integer    | null:false                    |
| from_area    | string     | null:false                    |
| arrival_date | date       | null:false                    |
| user         | references | null:false, foreign_key: true |
 
 ### Association

 - belongs_to :user
 - has_one    :record


 ## addressesテーブル

| column        | Type       | Options    |
| ------------- | ---------- | ---------- |
| post_code     | integer    | null:false |
| prefectures   | string     | null:false |
| city          | string     | null:false |
| house_number  | integer    | null:false |
| building_name | integer    | null:false |
| phone_number  | integer    | null:false |

### Association

- has_one      :record


## recordテーブル

| column    | Type        | Options                       |
| --------- | ----------- | ----------------------------- |
| user      | preferences | null:false, foreign_key: true |
| product   | preferences | null:false, foreign_key: true |
| address   | preferences | null:false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :product
- belongs_to :record