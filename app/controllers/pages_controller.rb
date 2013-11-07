class PagesController < ApplicationController
  def front
    redirect_to home_path if current_user
  end
  # not needed due to view temp
  #def front
  #end
end
