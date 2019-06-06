class ShippingTypesController < ApplicationController
  before_action :set_shipping_type, only: [:show, :edit, :update, :destroy]

  # GET /shipping_types
  # GET /shipping_types.json
  def index
    # Admin only
    if !current_user_is_admin
      respond_to do |format|
        format.html { redirect_to items_path }
      end
      return
    end

    @shipping_types = ShippingType.all
  end

  # GET /shipping_types/1
  # GET /shipping_types/1.json
  def show
    # Admin only
    if !current_user_is_admin
      respond_to do |format|
        format.html { redirect_to items_path }
      end
      return
    end
  end

  # GET /shipping_types/new
  def new
    # Admin only
    if !current_user_is_admin
      respond_to do |format|
        format.html { redirect_to items_path }
      end
      return
    end

    @shipping_type = ShippingType.new
  end

  # GET /shipping_types/1/edit
  def edit
    # Admin only
    if !current_user_is_admin
      respond_to do |format|
        format.html { redirect_to items_path }
      end
      return
    end
  end

  # POST /shipping_types
  # POST /shipping_types.json
  def create
    # Admin only
    if !current_user_is_admin
      respond_to do |format|
        format.html { redirect_to items_path }
      end
      return
    end

    @shipping_type = ShippingType.new(shipping_type_params)

    respond_to do |format|
      if @shipping_type.save
        format.html { redirect_to @shipping_type, notice: 'Shipping type was successfully created.' }
        format.json { render :show, status: :created, location: @shipping_type }
      else
        format.html { render :new }
        format.json { render json: @shipping_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shipping_types/1
  # PATCH/PUT /shipping_types/1.json
  def update
    # Admin only
    if !current_user_is_admin
      respond_to do |format|
        format.html { redirect_to items_path }
      end
      return
    end

    respond_to do |format|
      if @shipping_type.update(shipping_type_params)
        format.html { redirect_to @shipping_type, notice: 'Shipping type was successfully updated.' }
        format.json { render :show, status: :ok, location: @shipping_type }
      else
        format.html { render :edit }
        format.json { render json: @shipping_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shipping_types/1
  # DELETE /shipping_types/1.json
  def destroy
    # Admin only
    if !current_user_is_admin
      respond_to do |format|
        format.html { redirect_to items_path }
      end
      return
    end
    
    @shipping_type.destroy
    respond_to do |format|
      format.html { redirect_to shipping_types_url, notice: 'Shipping type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shipping_type
      @shipping_type = ShippingType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shipping_type_params
      params.require(:shipping_type).permit(:name, :doges_per_kilo)
    end
end
