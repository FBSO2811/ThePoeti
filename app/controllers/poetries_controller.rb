class PoetriesController < ApplicationController
  skip_after_action :verify_authorized, only: [:home, :about, :newsletter, :disclaimer, :new, :create, :amateur_poetries, :famous_poetries]
  skip_before_action :authenticate_user!, only: [:home, :about, :newsletter, :disclaimer, :new, :create]

  before_action :set_poetry, only: [:show, :edit, :update, :destroy,]
  before_action :authenticate_user!, except: [:index, :amateur_poetries]

  def index
    if params[:search]
      @poetries = policy_scope(Poetry).search(params[:search]).order("RANDOM()").limit(30)
    else
      @poetries = policy_scope(Poetry).order("RANDOM()").limit(30)
    end
  end

  # def index
  #   if params[:search]
  #     if params[:poetries_type] == "Famous"
  #       @poetries = policy_scope(Poetry).famous.search(params[:search]).order("created_at DESC").limit(30)
  #     elsif params[:poetries_type] == "Amateur"
  #       @poetries = policy_scope(Poetry).amateur.search(params[:search]).order("created_at DESC").limit(30)
  #     else
  #       @poetries = policy_scope(Poetry).search(params[:search]).order("created_at DESC").limit(30)
  #     end
  #   else
  #     @poetries = policy_scope(Poetry).order("RANDOM()").limit(30)
  #   end
  # end

  def amateur_poetries
    @poetries = policy_scope(Poetry).order("RANDOM()").limit(30).where.not(poster: "Admin")
  end

  def famous_poetries
    @poetries = policy_scope(Poetry).order("RANDOM()").limit(30).where(poster: "Admin")
  end


  def show
    authorize @poetry
  end

  def new
    @poetry = Poetry.new
  end

  def create
    Poetry.create(poetry_params)
    redirect_to poetries_path
  end

  def edit
    authorize @poetry
  end

  def update
    authorize @poetry
    @poetry.update(poetry_params)
    redirect_to poetry_path(@poetry)
  end

  def destroy
    authorize @poetry
    @poetry.destroy
    redirect_to poetries_path
  end

  def user_poetries
    @poetries = Poetry.all
  end


  private

  def poetry_params
    params.require(:poetry).permit(:title, :author, :body, :poster, :country)
  end

  def set_poetry
    @poetry = Poetry.find(params[:id])
  end
end
