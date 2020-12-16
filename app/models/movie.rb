class Movie < ApplicationRecord
  has_one_attached :image

validates :name, presence: true
validates :detail, presence: true
validates :country_id, numericality: { other_than: 1 }
validates :category_id, presence: true, numericality: { other_than: 1 }
validates :release_date_id, presence: true, numericality: { other_than: 1 }


extend ActiveHash::Associations::ActiveRecordExtensions
belongs_to_active_hash :category
belongs_to_active_hash :release_date
belongs_to_active_hash :country

end
