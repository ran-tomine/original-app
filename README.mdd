# テーブル設計

## users テーブル

| Column             | Type   | Options                 |
| ------------------ | ------ | ----------------------- |
| nickname           | string | null: false             |
| email              | string | null: false,unique:true |
| encrypted_password | string | null: false             |

### Association

- has_many :childcares
- has_many :childcare_comments
- has_many :events
- has_many :event_comments
- has_many :active_relationships, class_name: "Relationship", foreign_key: :following_id
- has_many :followings, through: :active_relationships, source: :follower
- has_many :passive_relationships, class_name: "Relationship", foreign_key: :follower_id
- has_many :followers, through: :passive_relationships, source: :following
- has_many :likes
- has_many :room_users
- has_many :rooms, through: :room_users
- has_many :messages


## childcares テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| title               | string     | null: false                    |
| diary               | text       | null: false                    |
| user                | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_many   :childcare_comments, dependent: :destroy
- has_many   :likes

## childcare_comments テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| content          | text       | null: false                    |
| childcare        | references | null: false, foreign_key: true |
| user             | references | null: false, foreign_key: true |
### Association

- belongs_to :user
- belongs_to :childcare

## events テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| name                | string     | null: false                    |
| location            | string     | null: false                    |
| datetime            | datetime   | null: false                    |
| description         | text       | null: false                    |
| address             | string     |                                |
| latitude            | float      |                                |
| longitude           | float      |                                |
| user                | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :event_comments, dependent: :destroy

## event_comments テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| content             | text       | null: false                    |
| event               | references | null: false, foreign_key: true |
| user                | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :event

## likes テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| user                | references | null: false, foreign_key: true |
| childcare           | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :childcare

## relationships テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| following           | references |                                |
| follower            | references |                                |


### Association

- has_many :active_relationships, class_name: "Relationship", foreign_key: :following_id
- has_many :passive_relationships, class_name: "Relationship", foreign_key: :follower_id
- has_many :followings, through: :active_relationships, source: :follower
- has_many :followers, through: :passive_relationships, source: :following

## rooms テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| name                | string     | null: false                    |


### Association

- has_many :room_users, dependent: :destroy
- has_many :users, through: :room_users
- has_many :messages, dependent: :destroy

## room_users テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| room                | references | null: false, foreign_key: true |
| user                | references | null: false, foreign_key: true |


### Association

- belongs_to :room
- belongs_to :user

## messages テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| content             | string     |                                |
| room                | references | null: false, foreign_key: true |
| user                | references | null: false, foreign_key: true |


### Association

- belongs_to :room
- belongs_to :user
