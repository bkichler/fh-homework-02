class Book < ApplicationRecord
  paginates_per 10

  def self.search(search_term)
    if !(search_term).nil?
        find_by_sql("Select * from books WHERE title ILIKE '%#{search_term}%' OR author 
                    ILIKE '%#{search_term}%' OR genre ILIKE '%#{search_term}%' OR classification ILIKE '%#{search_term}%' 
                    OR booktype ILIKE '%#{search_term}%' order by author")
    else
      order(:author)
    end
  end
end
