# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# create_table "authors", force: :cascade do |t|
#   t.string   "first_name"
#   t.string   "last_name"
#   t.integer  "age"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
# end

# create_table "authorships", force: :cascade do |t|
#   t.integer  "book_id"
#   t.integer  "author_id"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
# end

# create_table "books", force: :cascade do |t|
#   t.string   "title"
#   t.string   "genre"
#   t.string   "classification"
#   t.string   "booktype"
#   t.integer  "year"
#   t.datetime "created_at",     null: false
#   t.datetime "updated_at",     null: false
#   t.string   "sub_title"
# end

50.times do 
  Book.create(Faker::Book.title, Faker::Book.genre, 
              Faker::Book.classification, Faker::Book.booktype, 
              Faker::Date.between(50.years.ago, Date.today).strftime("%Y"))
end