class PoetriesController < ApplicationController
  before_action :set_poetry, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index,]

  # def index
  #   @poetries = policy_scope(Poetry).order("RANDOM()").limit(30)
  # end

  def index
    if params[:search]
      @poetries = policy_scope(Poetry).search(params[:search]).order("created_at DESC")
    else
      @poetries = policy_scope(Poetry).order("RANDOM()").limit(30)
    end
  end


  def show
  end

  def new
    @poetry = Poetry.new
    authorize @poetry
  end

  def create
    Poetry.create(poetry_params)
    authorize @poetry
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
    authorize @poetry
  end
end
