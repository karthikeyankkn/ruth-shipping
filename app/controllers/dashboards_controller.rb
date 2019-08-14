class DashboardsController < ApplicationController
	before_action :logged_in_user, only: [:show_user_dashboard]

  def show_user_dashboard
  	@imp_count = Import.all.count
  	@ready_duty_count = Import.where(status:"ready duty").count
  	@exam_over_count = Import.where(status:"exam over").count
  	@copy_count = Import.where(status:"COPY").count
  	@duty_paid_count = Import.where(status:"Duty paid").count
  	@riginal_check_count = Import.where(status:"riginal/check").count
  end
end
