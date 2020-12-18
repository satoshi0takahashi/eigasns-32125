class Evaluation < ApplicationRecord
  validates :point, presence: true
  belongs_to :user
  belongs_to :movie
end
