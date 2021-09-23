class User < ApplicationRecord
  validates :name,  length: { maximum: 15 }, presence: true
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i  }, presence: true
  validates :password, length: { in: 8..32 }, format:{ with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{7,}/ }, presence: true
  has_secure_password
  has_many :topics
  has_many :favorites
  has_many :favorite_topics, through: :favorites, source: 'topic'
end