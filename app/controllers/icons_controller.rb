class IconsController < ApplicationController
  before_action :set_icon, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  after_action :verify_authorized

  # GET /icons
  # GET /icons.json
  def index
    
    @icons = Icon.all
    authorize @icons
  end

  # GET /icons/1
  # GET /icons/1.json
  def show
    authorize @icon
  end

  # GET /icons/new
  def new
    @icon = Icon.new
    authorize @icon
  end

  # GET /icons/1/edit
  def edit
    authorize @icon
  end

  # POST /icons
  # POST /icons.json
  def create
    @icon = Icon.new(icon_params)
    authorize @icon
    respond_to do |format|
      if @icon.save
        format.html { redirect_to @icon, notice: 'Icon was successfully created.' }
        format.json { render :show, status: :created, location: @icon }
      else
        format.html { render :new }
        format.json { render json: @icon.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /icons/1
  # PATCH/PUT /icons/1.json
  def update
     authorize @icon
    respond_to do |format|
      if @icon.update(icon_params)
        format.html { redirect_to @icon, notice: 'Icon was successfully updated.' }
        format.json { render :show, status: :ok, location: @icon }
      else
        format.html { render :edit }
        format.json { render json: @icon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /icons/1
  # DELETE /icons/1.json
  def destroy
    authorize @icon
    @icon.destroy
    respond_to do |format|
      format.html { redirect_to icons_url, notice: 'Icon was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_icon
      @icon = Icon.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def icon_params
      params.require(:icon).permit(:user_id, :detail_id,  :top_icons,:icon_css, :name)
    end
end
