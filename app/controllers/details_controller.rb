class DetailsController < ApplicationController
  before_action :set_detail, only: [:outside_show, :show, :edit, :update, :destroy]

  # GET /details
  # GET /details.json
  def index
    @details = Detail.all
  end
  
  def outside_show 
    
     @names = User.names( @detail.user_id).first
   end
  # GET /details/1
  # GET /details/1.json
  def show
     
  end

  # GET /details/new
  def new
    @detail = Detail.new
  end

  # GET /details/1/edit
  def edit
  end

  # POST /details
  # POST /details.json
  def create
    @detail = Detail.new(detail_params)

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
    respond_to do |format|
      if @detail.update(detail_params)
        format.html { redirect_to @detail, notice: 'Detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @detail }
      else
        format.html { render :edit }
        format.json { render json: @detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /details/1
  # DELETE /details/1.json
  def destroy
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
      params.require(:detail).permit(:user_id, :name, :slug, :email_able, :details_email, :cellphone, :phone2, :country_id, :state_id, :city, :address, :province, :country, :social_link_1, :social_link_2, :social_link_3, :social_link_4, :social_link_5, :social_link_6, :social_link_7, :social_link_8, :social_link_9, :social_link_10)
    end
end
