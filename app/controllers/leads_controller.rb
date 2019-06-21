class LeadsController < ApplicationController
	before_action :logged_in_user, only: [:create, :destroy]

def new
  @lead = Lead.new
end

def index
  @lead = current_user.leads
end
  def create
  	@lead = current_user.leads.build(lead_params)
    if @lead.save
      flash[:success] = "Lead created!"
      redirect_to leads_url
    else
      render 'static_pages/home'
    end
  end

  def destroy
  end

  private

    def lead_params
      params.require(:lead).permit(:name, :email, :phone_number, :category, :city)
    end
end
