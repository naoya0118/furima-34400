# users テーブル

| Column     | Type     | Options     |
| ---------- | ------   | ----------- |
| nickname   | string   | null: false |
| email      | string   | null: false |
| password   | string   | null: false |
| last_name  | string   | null: false |
| first_name | string   | null: false |
| birthday   | datetime | null: false |

### Association

- has_many :products
- has_many :prototypes

## products テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| title      | string     | null: false,                   |
| price      | integer    | null: false,                   |
| category   | text       | null: false,                   |
| status     | string     | null: false,                   |
| user       | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- has_many   :comments
- has_one    :delivers

## deliverys テーブル

| Column | Type   | Options      |
| ------ | ------ | ------------ |
| fee    | string | null: false, | # integerかな？
| area   | string | null: false, |
| date   | string | null: false, | # datetimeかな？

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
- belongs_to :prototypes