class BooksController < ApplicationController

  def index
    @books = Book.search(params[:search_term]).page(params[:page])
  end

  def show
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])

    @book.update_attributes(book_params)
    if @book.valid?
      redirect_to @book, notice: 'Book was successfully updated'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to root_path
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.create(book_params)
    if @book.valid?
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  private

  def book_params
    params.require(:book).permit(:title, :genre, :classification, :booktype, :year, :sub_title, :search_term)
  end
end
