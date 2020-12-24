class Evaluation < ApplicationRecord
  validates :point, presence: true
  validates_uniqueness_of :user_id
  belongs_to :user
  belongs_to :movie
end
