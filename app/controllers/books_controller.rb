class BooksController < ApplicationController

  def index
  end

  def show
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
