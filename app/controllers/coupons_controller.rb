class CouponsController < ApplicationController
  before_action :set_coupon, only: [:show, :edit, :update, :destroy]

  def apply
    @coupon = Coupon.find_by_name(params[:coupon_code].upcase)
    respond_to do |format|
      if @coupon
        session[:coupon_id] = @coupon.id
        format.html { redirect_to request.referer, notice: 'Coupon was successfully applied!' }
      else
        session[:coupon_id] = nil
        format.html { redirect_to request.referer, notice: 'Invalid or expired coupon.' }
      end
    end
    return
  end

  # GET /coupons
  # GET /coupons.json
  def index
    # Admin only
    if !current_user_is_admin
      respond_to do |format|
        format.html { redirect_to items_path }
      end
      return
    end
    @coupons = Coupon.all
  end

  # GET /coupons/1
  # GET /coupons/1.json
  def show
    # Admin only
    if !current_user_is_admin
      respond_to do |format|
        format.html { redirect_to items_path }
      end
      return
    end
  end

  # GET /coupons/new
  def new
    # Admin only
    if !current_user_is_admin
      respond_to do |format|
        format.html { redirect_to items_path }
      end
      return
    end
    @coupon = Coupon.new
  end

  # GET /coupons/1/edit
  def edit
    # Admin only
    if !current_user_is_admin
      respond_to do |format|
        format.html { redirect_to items_path }
      end
      return
    end
  end

  # POST /coupons
  # POST /coupons.json
  def create
    # Admin only
    if !current_user_is_admin
      respond_to do |format|
        format.html { redirect_to items_path }
      end
      return
    end

    @coupon = Coupon.new(coupon_params)
    @coupon.name = @coupon.name.upcase
    respond_to do |format|
      if @coupon.save
        format.html { redirect_to @coupon, notice: 'Coupon was successfully created.' }
        format.json { render :show, status: :created, location: @coupon }
      else
        format.html { render :new }
        format.json { render json: @coupon.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /coupons/1
  # PATCH/PUT /coupons/1.json
  def update
    # Admin only
    if !current_user_is_admin
      respond_to do |format|
        format.html { redirect_to items_path }
      end
      return
    end

    @coupon.name = coupon_params[:name].upcase
    @coupon.discount = coupon_params[:discount]
    
    respond_to do |format|
      if @coupon.save
        format.html { redirect_to @coupon, notice: 'Coupon was successfully updated.' }
        format.json { render :show, status: :ok, location: @coupon }
      else
        format.html { render :edit }
        format.json { render json: @coupon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /coupons/1
  # DELETE /coupons/1.json
  def destroy
    # Admin only
    if !current_user_is_admin
      respond_to do |format|
        format.html { redirect_to items_path }
      end
      return
    end

    @coupon.destroy
    respond_to do |format|
      format.html { redirect_to coupons_url, notice: 'Coupon was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coupon
      @coupon = Coupon.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def coupon_params
      params.require(:coupon).permit(:name, :discount)
    end
end
