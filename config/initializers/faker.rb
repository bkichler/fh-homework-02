module BookClassification
  class Book < Faker::Base
    class << self
      def classification
        fetch('book.classifications')
      end
    end
  end
end
Faker.prepend BookClassification

module BookType
  class Book < Faker::Base
    class << self
      def booktype
        fetch('book.booktypes')
      end
    end
  end
end
Faker.prepend BookType