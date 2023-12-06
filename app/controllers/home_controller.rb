class HomeController < ApplicationController
  def index
    if user_signed_in?
      redirect_to events_path # Redirect to events index if user is logged in
    else
      render :index # Render landing page with login/register form
    end
  end
end
