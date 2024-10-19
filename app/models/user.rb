class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :validatable, :api

  has_many :participants, dependent: :delete_all
  has_many :events, through: :participants
end
