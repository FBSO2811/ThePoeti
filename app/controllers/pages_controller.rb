class PagesController < ApplicationController
  include Pundit
    skip_after_action :verify_authorized, only: [:home]

<<<<<<< HEAD
    skip_before_action :authenticate_user!, only: [:home]
=======
  skip_before_action :authenticate_user!, only: [:home]
  # skip_after_action :verify_authorized, except: [:home]
  # after_action :verify_authorized, except: [:home]
  # before_action :authenticate_user!, except: [:home,]

>>>>>>> 1bbec5f5898282f61d7564cc7564b57c9fe62aa7

  def home
  end
end
