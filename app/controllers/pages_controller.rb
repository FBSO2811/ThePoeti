class PagesController < ApplicationController
  include Pundit
    skip_after_action :verify_authorized, only: [:home]

  skip_before_action :authenticate_user!, only: [:home]
  # skip_after_action :verify_authorized, except: [:home]
  # after_action :verify_authorized, except: [:home]
  # before_action :authenticate_user!, except: [:home,]


  def home
  end
end
