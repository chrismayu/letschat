class DetailsController < ApplicationController
  before_action :set_detail, only: [ :edit, :update, :destroy]
  before_action :authenticate_user!, except: [ :outside_show]
  after_action :verify_authorized, except:  [ :outside_show]
  require 'uri'

  # GET /details
  # GET /details.json
  def index
    @details = Detail.all

    authorize @details 
  end
  
  def outside_show  
    params_id = params[:id].downcase
    
    if Detail.where(:name => params_id).present?
      @detail = Detail.friendly.find(params_id )
  
       @names = User.names(@detail.user_id).first
    else
        redirect_to root_path, alert: "Sorry - Could not find anyone with the name - #{params_id}"  
    end
    
    
   
   end
  # GET /details/1
  # GET /details/1.json
  def show
   
     @detail = current_user.detail
      @names = User.names(@detail.user_id).first
         authorize @detail
  end

  # GET /details/new
  def new
    @detail = Detail.new
    authorize @detail
  end

  # GET /details/1/edit
  def edit
    authorize @detail
   
    @icons = Icon.dropdown
   
  end

  # POST /details
  # POST /details.json
  def create
    @detail = Detail.new(detail_params)
    authorize @detail
    respond_to do |format|
      if @detail.save
        format.html { redirect_to @detail, notice: 'Detail was successfully created.' }
        format.json { render :show, status: :created, location: @detail }
      else
        format.html { render :new }
        format.json { render json: @detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /details/1
  # PATCH/PUT /details/1.json
  def update
    authorize @detail
    respond_to do |format|
      if @detail.update(detail_params)
        format.html { redirect_to @detail, notice: 'Your Information has been successfully updated.' }
        format.json { render :show, status: :ok, location: @detail }
      else
        format.html { render :edit }
        format.json { render json: @detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /details/1
  # DELETE /details/1.json
  def destroy_not_used
    @detail.destroy
    respond_to do |format|
      format.html { redirect_to details_url, notice: 'Detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_detail
      @detail = Detail.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def detail_params
      params.require(:detail).permit(:user_id, :name, :slug, :email_able, :details_email, :cellphone, :phone2, :country_id, :state_id, :city, :address, :province, :country, :social_link_1, :social_link_2, :social_link_3, :social_link_4, :social_link_5, :social_link_6, :social_link_7, :social_link_8, :social_link_9, :social_link_10, :social_link_1_icon, :social_link_1_url, :social_link_1_icon_id,  :social_link_2_icon, :social_link_2_url, :social_link_2_icon_id,  :social_link_3_icon, :social_link_3_url, :social_link_3_icon_id,  :social_link_4_icon, :social_link_4_url, :social_link_4_icon_id,  :social_link_5_icon, :social_link_5_url, :social_link_5_icon_id,  :social_link_6_icon, :social_link_6_url, :social_link_6_icon_id,  :social_link_7_icon, :social_link_7_url, :social_link_7_icon_id,  :social_link_8_icon, :social_link_8_url, :social_link_8_icon_id,  :social_link_9_icon, :social_link_9_url, :social_link_9_icon_id,  :social_link_10_icon, :social_link_10_url, :social_link_10_icon_id)
    end
end
