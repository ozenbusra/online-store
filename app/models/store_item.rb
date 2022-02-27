class StoreItem < ApplicationRecord
  belongs_to :store
  belongs_to :item

  scope :filter_by_item_id, ->(item_id) { where item_id: item_id }
  scope :filter_by_store_id, ->(store_id) { where store_id: store_id }
end
