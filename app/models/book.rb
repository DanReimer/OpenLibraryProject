class Book < ApplicationRecord
  has_many :identifiers
  has_one :cover
  has_and_belongs_to_many :authors

  validates :title, presence: true
  validates :publishDate, length: { minimum: 4 }, allow_blank: true
end
