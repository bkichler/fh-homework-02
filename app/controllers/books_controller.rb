class BooksController < ApplicationController

  def index
    if params[:search_term]
      @books = Book.search(params[:search_term])
    else
      @books = Book.order(:author).page params[:page]
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def update
  end

  def destroy
  end

  def edit
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :genre, :classification, :booktype, :year, :search_term)
  end
end
