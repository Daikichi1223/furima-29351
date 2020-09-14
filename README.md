#テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### association
- has_many :items
- has_many :purchases

## purchases テーブル
| Column        | Type       | Options     |
| ------------- | ---------- | ----------- |
| customer_area | string     | null: false |
| user_id       | references | null: false, foreign_key: true |

### association
- belongs_to :user
- belongs_to :item

## items テーブル
| Column   | Type   | Options     |
| ---------------- | ---------- | ----------- |
| image            | text       | null: false |
| item_name        | string     | null: false |
| item_explanation | text       | null: false |
| item_category    | string     | null: false |
| item_condition   | string     | null: false |
| delivary_fee     | string     | null: false |
| exhibitor_area   | string     | null: false |
| delivary_days    | integer    | null: false |
| item_price       | integer    | null: false |
| user_id          | references | null: false, foreign_key: true |

### association
- has_one: purchase
- belongs_to :user
