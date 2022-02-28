# online-store

online-store is an MVC application developed with Ruby on Rails version 7.0.2.2 and Ruby 3.0.3. 
Visit it on https://lit-sands-69579.herokuapp.com/

online-store provides a very simple user interface performing CRUD operations on a few entities:

* **item**: the entity of the items that will be presented and managed in the application. consisting of id and item_name columns.
* **location**: the entity of the locations of stores. consisting of id, address, street, city, country columns.
* **store**: the entity of the stores that will be presented and managed in the application. consisting of id, store_name, and location_id columns. 
* **store_item**: the entity that is being used as a mapping of stores to items (i.e. which item is in which store). consisting of id, item_id, store_id, price, stock_quantity columns.
* **favorite**: the entity that is being used as a favorite list for users. consisting of id, user_id, item_id, and store_id
* **user**: the entity of the users. consisting of id, email, encrypted_password, role id columns. the default value of role_id is 2(user role).
* **role**: the entity of the user roles. consisting of id, role_name columns. 

### Local Usage

Local usage steps are as below:

1. DB Migration
bin/rails db:migrate

2. Create seed data
bin/rails db:seed

3. Run the application :rocket:
bin/rails server