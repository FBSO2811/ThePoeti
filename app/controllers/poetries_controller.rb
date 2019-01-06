class PoetriesController < ApplicationController
  before_action :set_poetry, only: [:show, :edit, :update, :destroy]

  def index
    @poetries = Poetry.order("RANDOM()").limit(30)

  end

  def show
  end

  def new
    @poetry = Poetry.new
  end

  def create
    Poetry.create(poetry_params)
    redirect_to poetries_path
  end

  def edit

  end

  def update
    @poetry.save
    redirect_to poetry_path(@poetry)
  end

  def destroy
    @poetry.destroy
    redirect_to poetries_path
  end



  private

  def poetry_params
    params.require(:poetry).permit(:title, :author, :body)
  end

  def set_poetry
    @poetry = Poetry.find(params[:id])
  end
end

