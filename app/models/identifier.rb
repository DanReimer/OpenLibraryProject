class Identifier < ApplicationRecord
  belongs_to :book

  validates :idType, :number, presence: true
end
