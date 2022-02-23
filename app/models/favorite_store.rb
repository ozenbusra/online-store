class FavoriteStore < ApplicationRecord
  belongs_to :store
  belongs_to :user
end
