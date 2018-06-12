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

# nodoc
class Seed
  def self.start
    seed = Seed.new
    seed.create_books
    seed.create_authors
    seed.create_authorships
  end

  def create_books
    50.times do |i|
      book = Book.create!(:title => Faker::Book.title, :genre => Faker::Book.genre, 
                  :classification => Faker::Book.classification, :booktype => Faker::Book.booktype, 
                  :year => Faker::Date.between(50.years.ago, Date.today).strftime("%Y"), :sub_title => Faker::ChuckNorris.fact)
      puts "Book #{i + 1}: #{book.title} created!"
    end
  end

  def create_authors
    25.times do |i|
      author = Author.create!(:first_name => Faker::Name.first_name, 
                              :last_name => Faker::Name.last_name, :age => Faker::Number.between(18, 100))
      puts "Author #{i + 1}: #{author.first_name} #{author.last_name} created!"
    end
  end

  def create_authorships
    books = Book.all.ids
    authors = Author.all.ids

    associations = []
    books.each do |book|
      authors.each do |author|
        associations << [book, author]
      end
    end

    50.times do |i|
      authorship = Authorship.create!(:book_id => associations.sample[0], :author_id => associations.sample[1])
      puts "Authorship #{i + 1}: #{authorship.id} created!"
    end
  end
end

Seed.start