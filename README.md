#テーブル設計

## users テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| last_name       | string | null: false |
| first_name      | string | null: false |
| last_name_ruby  | string | null: false |
| first_name_ruby | string | null: false |
| birthday        | string | null: false |

### association
- has_many :items
- has_many :purchases

## purchases テーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| item   | reference  | null: false, foreign_key: true |
| user   | references | null: false, foreign_key: true |

### association
- belongs_to :user
- belongs_to :item
- has_one :addresses

## items テーブル
| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| image            | text       | null: false                    |
| item_name        | string     | null: false                    |
| item_explanation | text       | null: false                    |
| item_category    | integer    | null: false                    |
| item_condition   | integer    | null: false                    |
| delivary_fee     | integer    | null: false                    |
| exhibitor_area   | integer    | null: false                    |
| delivary_days    | integer    | null: false                    |
| item_price       | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

### association
- has_one: purchase
- belongs_to :user


## addresses テーブル
| Column        | Type       | Options     |
| ------------- | ---------- | ----------- |
| postal_code   | integer    | null: false |
| state         | string     | null: false |
| city          | string     | null: false |
| address       | string     | null: false |
| building_name | string     |             |
| phone_number  | integer    | null: false |

### association
- belongs_to :purchases