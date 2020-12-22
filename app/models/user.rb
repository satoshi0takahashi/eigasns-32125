class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, presence: true, length: { maximum: 10 }

  has_many :evaluations
  has_many :tweet
  has_many :favorites, dependent: :destroy
  has_many :movie, through: :favorite
end
