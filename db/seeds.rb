role_admin = Role.create(role_name: "admin")
role_user = Role.create(role_name: "user")

user_admin = User.create(email: "admin@admin.com", password: "abcabc", role: role_admin)
user_user = User.create(email: "user@user.com", password: "abcabc", role: role_user)

location_1 = Location.create(address: "Sapphire Carrefoursa", street: "Sapphire AVM", city: "Istanbul", country: "Turkey")
location_2 = Location.create(address: "4. Levent Migros", street: "4. Levent", city: "Istanbul", country: "Turkey")

store_1 = Store.create(store_name: "Sapphire Carrefoursa", location: location_1)
store_2 = Store.create(store_name: "4. Levent Migros", location: location_2)

item_1 = Item.create(item_name: "Apple")
item_2 = Item.create(item_name: "Coffee")
item_3 = Item.create(item_name: "Tea")

items = [item_1, item_2, item_3]
stores = [store_1, store_2]
users = [user_admin, user_user]

(items.product stores).collect { |item, store|
  StoreItem.create(item: item, store: store, price: 24.99, stock_quantity: 1000)
}

(users.product items).collect { |user, item|
  Favorite.create(user: user, item: item, store: nil)
}

(users.product stores).collect { |user, store|
  Favorite.create(user: user, store: store, item: nil)
}
