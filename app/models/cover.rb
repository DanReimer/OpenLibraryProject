class Cover < ApplicationRecord
  belongs_to :book

  # Regex from stack overflow: https://stackoverflow.com/questions/34561083/how-to-validate-url-in-rails-model
  URL_REGEX = /\A(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?\z/ix
  validates :smallLink, :mediumLink, :largeLink, presence: true, format: { with: URL_REGEX, message: 'not a URL'}
end
