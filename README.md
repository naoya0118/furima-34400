# users テーブル

| Column             | Type     | Options                       |
| ------------------ | ------   | ----------------------------- |
| nickname           | string   | null: false                   |
| email              | string   | null: false, uniqueness: true |
| encrypted_password | string   | null: false                   |
| last_name          | string   | null: false                   |
| first_name         | string   | null: false                   |
| kana_last_name     | string   | null: false                   |
| kana_first_name    | string   | null: false                   |
| birthday           | datetime | null: false                   |

### Association

- has_many :products
- has_many :comments

## products テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| title      | string     | null: false,                   |
| price      | integer    | null: false,                   |
| category   | text       | null: false,                   |
| status     | string     | null: false,                   |
| user       | references | null: false, foreign_key: true |
| buyer      | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- has_many   :comments
- has_one    :buyers

## buyers テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| delivery_fee  | string     | null: false,                   |
| delivery_area | string     | null: false,                   |
| delivery_date | string     | null: false,                   |
| adders        | string     | null: false,                   |
| buyer_name    | string     | null: false,                   |
| product       | references | null: false, foreign_key: true |

### Association

- belongs_to :products

## comments テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| text      | text       | null: false,                   |
| user      | references | null: false, foreign_key: true |
| product   | references | null: false, foreign_key: true |


### Association

- belongs_to :users
- belongs_to :products