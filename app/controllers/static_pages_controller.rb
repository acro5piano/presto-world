class StaticPagesController < ApplicationController
  def index
    if current_user
      render 'static_pages/dashboard'
    else
      render 'static_pages/landing_page'
    end
  end

  def landing_page
  end

  def about
  end

  def dashboard
  end

  def company
  end

  def user_terms
  end
end
