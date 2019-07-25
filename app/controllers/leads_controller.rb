class LeadsController < ApplicationController
	before_action :logged_in_user, only: [:create, :destroy, :show]
  skip_before_action :verify_authenticity_token, :only => [:landing_page_lead]

  include HTTParty

def new
  @lead = Lead.new
end

def index
  # @lead = current_user.leads

  # pluck city and category
  @leads_category = current_user.leads.distinct.pluck(:category)
  @leads_city = current_user.leads.distinct.pluck(:city)

  # post sms
  @result = []
    if params[:category] && params[:city] && params[:message]
      @spydy_sms = current_user.leads.where({:category => params[:category], :city => params[:city]}).pluck(:phone_number)

      spydy_sms_numbers = @spydy_sms.join(', ')
      puts spydy_sms_numbers
      @response = HTTParty.post("http://pay4sms.in/sendsms/?token=4efd83247c8af1201337c8c627a3d9ae&credit=3&sender=SPINII&message=#{params[:message]}&number=#{spydy_sms_numbers}");
      @result = @response.body
      @leads = current_user.leads.all
      flash[:success] = "SMS blast finished successfully..!"
      # debugger
    elsif params[:category] && params[:city]
      @leads = current_user.leads.where({:category => params[:category], :city => params[:city]})
    else
      @leads = current_user.leads.all
    end
end

def create
	@lead = current_user.leads.build(lead_params)
  if @lead.save
    flash[:success] = " Lead created"
    redirect_to leads_url
  else
    # render 'static_pages/home'
    render 'leads/new'    
  end
end

# lead receive from landing page
def landing_page_lead
  @lead = Lead.new(lead_params)
  if @lead.save
    render json: @lead
  else
    render json: @lead.errors.full_messages
  end
end


def import
  Lead.import(params[:file])
  flash[:success] = " Data Uploaded.."
  redirect_to leads_path
end

def show  
  @lead = current_user.leads.find(params[:id])
end

def edit
   @lead = Lead.find(params[:id])
end

def update
  @lead = current_user.leads.build(lead_params)
  if @lead.save
    flash[:success] = " Lead updates"
    redirect_to leads_url
  else
    render 'edit'
  end
end

def destroy
  @lead = Lead.find(params[:id])
  @lead.destroy
  flash[:danger] = " Lead deleted successfully..!"
  redirect_to leads_path
end

# download sample csv file
def download_sample_leads_csv
  send_file "#{Rails.root}/app/assets/documents/spydy-sample-lead-upload-csv.csv", type: "application/csv", x_sendfile: true
end

private

  def lead_params
    params.require(:lead).permit(:name, :email, :phone_number, :category, :city, :source, :host, :user_agent, :user_id)
  end
end
