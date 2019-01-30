class Animal < ApplicationRecord
  has_many :sightings
  validates :name, presence: true,
                     length: { minimum: 2 }
end
