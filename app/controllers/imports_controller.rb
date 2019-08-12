class ImportsController < ApplicationController

	before_action :logged_in_user, only: [:create, :destroy, :show]
	before_action :set_import, only: [:edit, :update]

  # skip_before_action :verify_authenticity_token, :only => [:landing_page_lead]

  include HTTParty

def new
  @import = Import.new
end

def index
 @imports = Import.all
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

private

  def import_params
    params.require(:import).permit(:job_no, :imp, :supplier_name, :cargo_name, :port_of_loading, :line, :bl_no, :status, :_20_inch, :_40_inch, :vsl_name, :free_days, :lot_no, :shifting, :weight, :arrived, :dem_upto, :user_id)
  end
  def set_import
      @import = Import.find(params[:id])
    end
end
