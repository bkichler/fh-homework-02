class BooksController < ApplicationController

  def index
    @books = if params[:search_term]
        if Book.where('title LIKE ?', "%#{params[:search_term]}%").empty?  
          Book.where('author LIKE ?', "%#{params[:search_term]}%").page params[:page]
        else 
          Book.where('title LIKE ?', "%#{params[:search_term]}%").page params[:page]
        end
      else
        Book.order(:author).page params[:page]
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
