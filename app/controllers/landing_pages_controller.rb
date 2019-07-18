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

	def render_page
		# @masked_leads = []
  #     @verified_leads = VerifiedLeads.all
  #     @verified_leads.each do |i|
  #        @masked_lead = {
  #         "id": i.id,
  #         "name": (i.name[0,4]).ljust(10, "*"),
  #         "phone_number": ((i.phone_number).to_s[0,5]).ljust(10, "*"),
  #         "email": (i.email[0,4]).ljust(10, "*"),
  #         "preferred_unit_type": i.preferred_unit_type,
  #         "preferred_location": i.preferred_location,
  #         "budget": i.budget,
  #         "additional_description": i.additional_description,
  #         "credit": i.credit,
  #         "created_at": i.created_at
  #        }
  #        @masked_leads << @masked_lead
  #     end
  #     render json: ["masked_leads": @masked_leads], status: 200
  	# @section_1 = []
  @landing_page = LandingPage.find(params[:id])
  	@landing_page_data = {
  		"title": @landing_page.name,
  		"custom_url": @landing_page.custom_url,
  		"logo": @landing_page.logo.url,
  		"banner_image": @landing_page.banner_image.url,
  		"about_description": @landing_page.about_description,
  		"section_1": @section_1 = {
  			"section_1_image": @landing_page.section_1_image.url,
  			"section_1_content": @landing_page.section_1_content
  		},
  		"section_2": @section_2 = {
  			"section_2_image": @landing_page.section_2_image.url,
  			"section_2_content": @landing_page.section_2_content
  		},
  		"section_3": @section_3 = {
  			"section_3_icon_1": @landing_page.section_3_icon_1.url,
  			"section_3_icon_2": @landing_page.section_3_icon_2.url,
  			"section_3_icon_3": @landing_page.section_3_icon_3.url,
  			"section_3_description_1": @landing_page.section_3_description_1,
  			"section_3_description_2": @landing_page.section_3_description_2,
  			"section_3_description_3": @landing_page.section_3_description_3
  		},
  		"gallery": @gallery = {
  			"gallery_img_1": @landing_page.gallery_img_1.url,
  			"gallery_img_2": @landing_page.gallery_img_2.url,
  			"gallery_img_3": @landing_page.gallery_img_3.url,
  			"gallery_img_4": @landing_page.gallery_img_4.url,
  			"gallery_img_5": @landing_page.gallery_img_5.url,
  			"gallery_img_6": @landing_page.gallery_img_6.url,
  			"gallery_img_7": @landing_page.gallery_img_7.url,
  			"gallery_img_8": @landing_page.gallery_img_8.url,
  			"gallery_img_9": @landing_page.gallery_img_9.url,
  			"gallery_img_10": @landing_page.gallery_img_10.url
  		},
  		"our_client_logo": @our_client_logo = {
  			"our_client_logo_1": @landing_page.our_client_logo_1.url,
  			"our_client_logo_2": @landing_page.our_client_logo_2.url,
  			"our_client_logo_3": @landing_page.our_client_logo_3.url,
  			"our_client_logo_4": @landing_page.our_client_logo_4.url,
  			"our_client_logo_5": @landing_page.our_client_logo_5.url
  		},
			"testimonial_1_name": @landing_page.testimonial_1_name,
			"testimonial_content_1": @landing_page.testimonial_content_1,
			"testimonial_2_name": @landing_page.testimonial_2_name,
			"testimonial_content_2": @landing_page.testimonial_content_2

  	}
  	render json: ["landing_page_data": @landing_page_data], status: 200
	end

	private

    def landing_page_params
      params.require(:landing_page).permit( :name, :email, :phone_number, :query, :logo, :banner_image, :about_description, :section_1_image, :section_2_image, :section_1_content, :section_2_content, :video_url, :section_3_icon_1, :section_3_icon_2, :section_3_icon_3, :gallery_img_1, :gallery_img_2, :gallery_img_3, :gallery_img_4, :gallery_img_5, :gallery_img_6, :gallery_img_7, :gallery_img_8, :gallery_img_9, :gallery_img_10, :our_client_logo_1, :our_client_logo_2, :our_client_logo_3, :our_client_logo_4, :our_client_logo_5, :testimonial_content_1, :testimonial_content_2, :user_id, :testimonial_1_name, :testimonial_2_name, :section_3_description_1, :section_3_description_2, :section_3_description_3, :custom_url)
    end

end