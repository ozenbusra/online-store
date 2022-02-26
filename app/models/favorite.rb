class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :item, optional: true
  belongs_to :store, optional: true
end
