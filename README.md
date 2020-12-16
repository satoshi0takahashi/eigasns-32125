# Table detail

# Users

|Column    |Type      |Options|
|----------|----------| ---------|
|email     |string    |Null: false, unique:true|
|encrypted_password  |string    |Null: false|
|nickname      |string    |Null: false|


## Association

- has_many :movies
- has_many :comments
- has_many :comments
- has_one :tweet
- has_one :follows


# Movie

|Column    |Type      |Options|
|----------|----------| ---------|
|name     |string    |Null: false|
|detail|text      |Null: false|
|category_id   |integer      |Null: false|
|release_date   |date      ||
|like      |integer ||

## Association
- belongs_to :user
- has_one :Evaluations
- has_one :comments
- has_one :favorites
- has_one :trivia

# trivia
|Column    |Type      |Options|
|----------|----------| ---------|
|title     |string    |Null: false|
|text|text      |Null: false|
|user |references   |foreign key:true|
|movie |references   |foreign key:true|

## Association
- belongs_to :user
- belongs_to :movie

# Evaluation

|Column    |Type      |Options|
|----------|----------| ---------|
|name     |string    |Null: false|
|thought      |Null: false|


## Association
- belongs_to :user
- belongs_to  :movie


# Favorite

|Column    |Type      |Options|
|----------|----------| ---------|
|user |references   |foreign key:true|
|movie      |references   |foreign key:true|

## Association

- belongs_to :user
- belongs_to :movie


# Follow

|Column    |Type      |Options
|----------|----------| ---------|
|follower_id   |integer      |Null: false|
|following_id   |integer      |Null: false|

## Association

- belongs_to :user

# Comment

|Column    |Type      |Options|
|----------|----------| ---------|
|user |references   |foreign key:true|
|movie      |references   |foreign key:true|

## Association

- belongs_to :user
- belongs_to :movie


# Tweet

| Column  | Type       Options  |
| ------- | ---------- |-----------------------------|
| content | string   | null: false        |
| user    | references | null: false, foreign_keytrue|

## Association

- belongs_to :user