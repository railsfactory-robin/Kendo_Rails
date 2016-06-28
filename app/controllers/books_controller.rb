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
  	end

  	def create
     @book = Book.new(book_params)
     @book.category_id = params["book"]["category"]["id"]
    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: 'book was successfully created.' }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
  	@book = Book.find(params[:id])
    @book.category_id = params["book"]["category"]["id"]
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'book was successfully updated.' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
  	@book = Book.find(params[:id])
    @book.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

private

  def book_params
    params.require(:book).permit(:book_name, :price, :category_id)
  end

end
