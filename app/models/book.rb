class Book < ApplicationRecord
  has_many :identifiers
  has_one :cover
  has_and_belongs_to_many :authors
end
