class BooksController < ApplicationController
  before_action :set_book, only: [:show, :update, :destroy]

  # GET /books
  def index
    @books = Book.all.limit(10)

    render json: BookRepresenter.new(@books).books_json, status: :ok
  end

  # GET /books/1
  def show
    render json: BookRepresenter.new(@book).as_json, status: :ok
  end

  # POST /books
  def create
    @book = Book.new(book_params)

    if @book.save
      render json: BookRepresenter.new(@book).as_json, status: :created
    else
      render json: { error: @book.errors}, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /books/1
  def update
    if @book.update(book_params)
      render json: BookRepresenter.new(@book).as_json, status: :ok
    else
      render json: { error: @book.errors }, status: :unprocessable_entity
    end
  end

  # DELETE /books/1
  def destroy
    @book.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def book_params
      params.require(:book).permit(:title, :content, :category, :numPage, :raiting)
    end
end
