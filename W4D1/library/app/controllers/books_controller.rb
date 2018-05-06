class BooksController < ApplicationController
  def index
    @books = Book.all
    render :index
    # render :index
  end

  def new
    render :new
    # your code here
  end

  def create
    book = Book.new(book_params)

    book.save!
    redirect_to books_url
    # your code here
  end

  def destroy
    book = Book.find_by_id(params[:id])
    book.destroy
  redirect_to books_url
  end

  private
  def book_params
    params.require(:book).permit(:title, :author)
  end
end
