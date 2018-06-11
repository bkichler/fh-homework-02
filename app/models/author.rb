class Author < ApplicationRecord
  has_many :books

  def self.full_name
    first_name + ' ' + last_name
  end
end
