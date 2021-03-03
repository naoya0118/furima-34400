# users テーブル

| Column             | Type     | Options                       |
| ------------------ | ------   | ----------------------------- |
| nickname           | string   | null: false                   |
| email              | string   | null: false, unique: true     |
| encrypted_password | string   | null: false                   |
| last_name          | string   | null: false                   |
| first_name         | string   | null: false                   |
| kana_last_name     | string   | null: false                   |
| kana_first_name    | string   | null: false                   |
| birthday           | date     | null: false                   |

### Association

- has_many :products
- has_many :comments
- has_many :purchase_managements

## products テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| title         | string     | null: false,                   |
| price         | integer    | null: false,                   |
| category      | text       | null: false,                   |
| status        | string     | null: false,                   |
| delivery_fee  | string     | null: false,                   |
| delivery_area | string     | null: false,                   |
| delivery_date | string     | null: false,                   |
| user          | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- has_many   :comments
- has_one    :Purchase_management

## Purchase_managements テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| postal_code  | text       | null: false,                   |
| prefectures  | text       | null: false,                   |
| municipality | text       | null: false,                   |
| address      | text       | null: false,                   |
| building     | text       | null: false,                   |
| phone_number | text       | null: false,                   |
| user         | references | null: false, foreign_key: true |
| product      | references | null: false, foreign_key: true |

### Association

- belongs_to :products
- belongs_to :users

## comments テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| text      | text       | null: false,                   |
| user      | references | null: false, foreign_key: true |
| product   | references | null: false, foreign_key: true |


### Association

- belongs_to :users
- belongs_to :products