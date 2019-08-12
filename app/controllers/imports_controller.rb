class ImportsController < ApplicationController

	before_action :logged_in_user, only: [:create, :destroy, :show]
	before_action :set_import, only: [:edit, :update]
  skip_before_action :verify_authenticity_token, :only => [:send_individual_import_report_mail]

  include HTTParty

def new
  @import = Import.new
end

def index
  # show uniqe data
  @import_imp = current_user.imports.uniq.pluck(:imp)
  @import_line = current_user.imports.uniq.pluck(:line)
  @import_status = current_user.imports.uniq.pluck(:status)

  @imports = Import.where(nil) # creates an anonymous scope
  @imports = @imports.imp(params[:imp]) if params[:imp].present?
  @imports = @imports.line(params[:line]) if params[:line].present?
  @imports = @imports.status(params[:status]) if params[:status].present?
 # @imports = Import.all
end

def create
	@import = current_user.imports.build(import_params)
  if @import.save
    flash[:success] = " Data created"
    redirect_to imports_url
  else
    render 'imports/new'    
  end
end

def show  
  @import = Import.find(params[:id])
end

def edit
   @import = Import.find(params[:id])
end

def update
  if @import.update(import_params)
    flash[:success] = " Data updates"
    redirect_to imports_url
  else
    render 'edit'
  end
end

def destroy
  @import = Import.find(params[:id])
  @import.destroy
  flash[:danger] = " Data deleted successfully..!"
  redirect_to imports_path
end

# send_individual_import_report_mail
def send_individual_import_report_mail
  @import = Import.find(params[:sp_data][:import_id])
  @sp_email_data = params[:sp_data][:email]
  # # debugger
  # puts "------------------------------"
  # puts @sp_email_data
  # puts "------------------------------"
  @sp_delivery_details = {}
  @sp_delivery_details[:email] = @sp_email_data
  @sp_delivery_details[:import] = @import
  UserMailer.send_email_to_sps(@sp_delivery_details).deliver_now
  flash[:success] = "Mail sent successfully..!"
  redirect_to imports_path
end

private

  def import_params
    params.require(:import).permit(:job_no, :imp, :supplier_name, :cargo_name, :port_of_loading, :line, :bl_no, :status, :_20_inch, :_40_inch, :vsl_name, :free_days, :lot_no, :shifting, :weight, :arrived, :dem_upto, :user_id)
  end
  def set_import
      @import = Import.find(params[:id])
    end
end
