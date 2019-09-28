class BooksController < ApplicationController
	before_action :authenticate_user!

	# def new
	# 	@book = Book.new
	# end

	def create
		@book2 = Book.new(book_params)
		# @book.user_id = current_user.id
		@book2.user_id = current_user.id
		if @book2.save
			redirect_to book_path(@book2),notice: 'You have creatad book successfully.'
		else @books = Book.all
			render :index
		end
	end

	def index
		@books = Book.all
		@book2 = Book.new
		@user = current_user
	end

	def show
		@book = Book.find(params[:id])
		@book2 = Book.new
	end

	def update
		@book = Book.find(params[:id])
		if @book.user_id != current_user.id
			redirect_to books_path
		elsif @book.update(book_params)
			redirect_to book_path(@book.id),notice: 'You have updated book successfully.'
		else
			render :edit
		end
	end

	def edit
		@book = Book.find(params[:id])
		if @book.user_id != current_user.id
			redirect_to books_path
		end
	end

	def destroy
		book = Book.find(params[:id])
		book.destroy
		redirect_to books_path, notice: 'Book was successfully destroyed.'
	end

	private
	def book_params
		params.require(:book).permit(:title, :body)
	end
end
