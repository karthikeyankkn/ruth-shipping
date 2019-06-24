class DashboardsController < ApplicationController
	before_action :logged_in_user, only: [:show_user_dashboard]

  def show_user_dashboard
  	@lead = current_user.leads.all
  	@lead_count = @lead.count
  end
end
