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

- has_many :items
- has_many :buys

## items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| title            | string     | null: false,                   |
| explanation      | text       | null: false,                   |
| price            | integer    | null: false,                   |
| category_id      | integer    | null: false,                   |
| state_id         | integer    | null: false,                   |
| delivery_fee_id  | integer    | null: false,                   |
| delivery_area_id | integer    | null: false,                   |
| delivery_date_id | integer    | null: false,                   |
| user             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :buy

## deliverys テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| postal_code      | string     | null: false,                   |
| delivery_area_id | integer    | null: false,                   |
| municipality     | string     | null: false,                   |
| address          | string     | null: false,                   |
| building         | string     |                                |
| phone_number     | string     | null: false,                   |
| buy              | references | null: false, foreign_key: true |

### Association

- belongs_to :buy

## buys テーブル

| Column    | Type    | Options       |
| --------- | ------- | ------------- |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :delivery