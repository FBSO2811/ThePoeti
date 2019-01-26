class PagesController < ApplicationController
  include Pundit
    skip_after_action :verify_authorized, only: [:home, :about, :newsletter, :disclaimer]

    skip_before_action :authenticate_user!, only: [:home, :about, :newsletter, :disclaimer]
  # skip_after_action :verify_authorized, except: [:home]
  # after_action :verify_authorized, except: [:home]
  # before_action :authenticate_user!, except: [:home,]

  def home
  end

  def about
  end

  def newsletter
  end

  def disclaimer
  end

end
