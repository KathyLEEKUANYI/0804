class BooksController < ApplicationController

	def index
    @book = Book.all
	end

	def new
    @book = Book.new
	end

	def create
    @book = Book.new(clean)
		  if @book.save
			redirect_to "/books"
			else
				render "books/new"
			end
	end

	def show
    @book = Book.find(params[:id])
	end

  def edit
    @book = Book.find(params[:id])
	end


	def update
   @book = Book.find(params[:id])
	 if @book.update(clean)
		redirect_to "/books"
		else
				render :edit
	  end
   end

	def destroy
		@book = Book.find(params[:id])
		@book.destroy
	  redirect_to "/books"

	end
	private

	def clean
    params.require(:book).permit(:title ,:content , :price)
	end

end
