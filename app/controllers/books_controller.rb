class BooksController < ApplicationController

  def index
    @books = Book.all
  end
 
  def show
    @book = Book.find(params[:id])
  end
 
  def new
    @book = Book.new
  end
 
  def edit
    @book = Book.find(params[:id])
  end
 
  def create
    @book = Book.new(book_params)
 
    if @book.save
      redirect_to @book
    else
      render 'new'
    end
  end
 
  def update
    @book = Book.find(params[:id])
 
    if @book.update(book_params)
      redirect_to @book
    else
      render 'edit'
    end
  end
 
  def assign
    @book = Book.find(params[:id])
    @book.student_id = params[:book][:student_id]
    if params[:book][:student_id].present?
     @book.borrowed_on =Time.now
     @book.return_on =Time.now+864000
   else
     @book.borrowed_on=nil
     @book.return_on=nil
   end
   if @book.save
   end
     redirect_to books_path
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
 
    redirect_to books_path
  end
 
  private
    def book_params
      params.require(:book).permit(:title, :author, :description, :student_id)
    end
end
