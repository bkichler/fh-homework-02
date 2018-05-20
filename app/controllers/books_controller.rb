class BooksController < ApplicationController

  def index
    @books = Book.order(:author)
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
    params.require(:book).permit(:title, :author, :genre, :classification, :booktype, :year)
  end
end
