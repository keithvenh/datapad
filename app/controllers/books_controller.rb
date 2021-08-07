class BooksController < ApplicationController

  layout 'admin'

  def index
    @books = Book.all.order(:title)
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have successfully updated #{@book.title}."
      redirect_to books_path
    else
      flash.now[:alert] = "Beep Boop. Something went wrong."
      render 'edit'
    end
  end

  private

    def book_params
      params.require(:book).permit(:game, :title, :subtitle, :type_of)
    end
end
