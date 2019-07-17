class LandingPagesController < ApplicationController
	before_action :logged_in_user, only: [:create, :destroy, :show]

	def index
		@landing_pages = current_user.landing_pages.all
	end

	def new
		@landing_page = LandingPage.new
	end

	def create
		@landing_page = current_user.landing_pages.build(landing_page_params)
  	
  	if @landing_page.save
      # @landing_page.send_activation_email
      flash[:success] = "Landing Page Created..!"
      redirect_to landing_pages_url
  	else
  			render 'new'	
  	end
	end

	def edit
		@landing_page = LandingPage.find(params[:id])
	end

	def show
		@landing_page = current_user.landing_pages.find(params[:id])
	end

	def update
		@landing_page = LandingPage.find(params[:id])
		if @landing_page.update_attributes(landing_page_params)
      # Handle a successful update.
      flash[:success] = "LandingPage updated"
      redirect_to @landing_page
    else
      render 'edit'
    end
	end

	def destroy
		LandingPage.find(params[:id]).destroy
    flash[:danger] = "LandingPage deleted"
    redirect_to landing_pages_url
	end

	private

    def landing_page_params
      params.require(:landing_page).permit( :name, :email, :phone_number, :query, :logo, :banner_image, :about_description, :section_1_image, :section_2_image, :section_1_content, :section_2_content, :video_url, :section_3_icon_1, :section_3_icon_2, :section_3_icon_3, :gallery_img_1, :gallery_img_2, :gallery_img_3, :gallery_img_4, :gallery_img_5, :gallery_img_6, :gallery_img_7, :gallery_img_8, :gallery_img_9, :gallery_img_10, :our_client_logo_1, :our_client_logo_2, :our_client_logo_3, :our_client_logo_4, :our_client_logo_5, :testimonial_content_1, :testimonial_content_2, :user_id, :testimonial_1_name, :testimonial_2_name, :section_3_description_1, :section_3_description_2, :section_3_description_3)
    end

end
