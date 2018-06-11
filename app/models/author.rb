class Author < ApplicationRecord
  has_many :books, :through => :authorships

  def self.full_name
    first_name + ' ' + last_name
  end
end
