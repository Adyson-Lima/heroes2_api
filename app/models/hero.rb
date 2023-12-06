class Hero < ApplicationRecord
  validates :name, :description, presence: true
end
