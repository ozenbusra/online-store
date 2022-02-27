class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :item, optional: true
  belongs_to :store, optional: true

  scope :filter_by_user_id, ->(user_id) { where user_id: user_id }
  scope :filter_by_item_id, ->(item_id) { where item_id: item_id }
  scope :filter_by_store_id, ->(store_id) { where store_id: store_id }
end
