class StaticPagesController < ApplicationController

  def home
    @lead = current_user.leads.build if logged_in?
  end

  def help
  end

  def about
  end

  def contact
  end
end
