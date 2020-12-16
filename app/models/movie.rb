class Movie < ApplicationRecord
  belongs_to :user
  has_one_attached :image


validates :name, presence: true
validates :detail, presence: true
validates :category_id, presence: true
validates :release_date, presence: true

validates :content, presence: true


end
