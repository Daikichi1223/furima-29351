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
| birthday        | date   | null: false |

### association
- has_many :items
- has_many :orders

## orders テーブル
| Column | Type        | Options                        |
| ------ | ----------- | ------------------------------ |
| item   | references  | null: false, foreign_key: true |
| user   | references  | null: false, foreign_key: true |

### association
- belongs_to :user
- belongs_to :item
- has_one :address

## items テーブル
| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| name           | string     | null: false                    |
| explanation    | text       | null: false                    |
| category       | integer    | null: false                    |
| condition      | integer    | null: false                    |
| delivary_fee   | integer    | null: false                    |
| exhibitor_area | integer    | null: false                    |
| delivary_day   | integer    | null: false                    |
| price          | integer    | null: false                    |
| user           | references | null: false, foreign_key: true |

### association
- has_one :order
- belongs_to :user


## addresses テーブル
| Column          | Type       | Options                        |
| --------------- | -----------| ------------------------------ |
| postal_code     | string     | null: false, default: ""       |
| exhibitor_area  | integer    | null: false                    |
| city            | string     | null: false, default: ""       |
| address         | string     | null: false, default: ""       |
| building_name   | string     |                                |
| phone_number    | string     | null: false, default: ""       |
| order           | references | null: false, foreign_key: true |

### association
- belongs_to :order
