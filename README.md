# テーブル設計

## users テーブル

| Column              | Type    | Options     |
| ------------------- | ------- | ----------- |
| name                | string  | null: false |
| email               | string  | null: false |
| password            | string  | null: false |
| first-name          | string  | null: false |
| last-name           | string  | null: false |
| first-name-furigana | string  | null: false |
| last-name-furigana  | string  | null: false |
| birthday_id         |  date   | null: false |

### Association

- has_many : items
- has_many : comments
- has_many : buy


## items テーブル

| Column                 | Type    | Options                         |
| ---------------------- | ------- | ------------------------------- |
| name                   | string  | null: false                     |
| text                   | text    | null: false                     |
| category_id            | integer | null: false                     |
| status_id              | integer | null: false                     |
| delivery_fee_id        | integer | null: false                     |
| prefecture_id          | integer | null: false                     |
| days_until_shipping_id | integer | null: false                     |
| price                  | integer | null: false                     |
| user_id                | integer | null: false , foreign_key: true |

### Association

- belongs_to : users 
- has_many   : comments
- has_one    : buy
- has_one    : shipping_address


## comments テーブル

| Column              | Type    | Options                         |
| ------------------- | ------- | ------------------------------- |
| comment             | text    | null: false                     |
| user_id             | integer | null: false , foreign_key: true |
| items_id            | integer | null: false , foreign_key: true |

### Association

- belongs_to : users 
- belongs_to : items


## buy テーブル

| Column              | Type    | Options                         |
| ------------------- | ------- | ------------------------------- |
| user_id             | integer | null: false , foreign_key: true |
| items_id            | integer | null: false , foreign_key: true |

### Association

- belongs_to : users 
- belongs_to : items



## shipping_address テーブル

| Column              | Type    | Options                         |
| ------------------- | ------- | ------------------------------- |
| postal_code         | integer | null: false                     |
| prefecture_id       | integer | null: false                     |
| city                | string  | null: false                     |
| house_number        | string  | null: false                     |
| building_name       | string  |                                 |
| phone_number        | integer | null: false                     |
| items_id            | integer | null: false , foreign_key: true |
### Association

- belongs_to : items