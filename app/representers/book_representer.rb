class BookRepresenter < BooksController
  def initialize(book)
    @book = book
  end

  def books_json
    tmp = []
    book.each do |item|
      tmp.push(
        {
          id: item.id,
          title: item.title,
          content: item.content,
          category: item.category,
          numPages: item.numPage,
          raiting: item.raiting
      }
      )
    end

    tmp
  end

  def as_json
    {
        id: book.id,
        title: book.title,
        content: book.content,
        category: book.category,
        numPages: book.numPage,
        raiting: book.raiting
    }
  end

  private

  attr_reader :book
end