class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
    redirect_to projects_path if user_signed_in?
  end

  def about

  end

end
