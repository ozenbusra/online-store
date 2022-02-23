class Store < ApplicationRecord
  belongs_to :location

  validates :store_name, presence: true
  validates :location_id, presence: true
end
