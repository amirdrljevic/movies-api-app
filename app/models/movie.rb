class Movie < ApplicationRecord
  # a basic validation just for one attribute
  validates :name, presence: true,  length: { minimum: 2 }
end
