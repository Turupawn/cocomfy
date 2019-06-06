class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    # Public method
    if current_user_is_admin
      @orders = Order.all
    elsif current_user
      @orders = Order.where(email: current_user.email)
    else
      @orders = []
    end
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    # Public method
    if @order.secure_hash != params[:secure_hash]
      respond_to do |format|
        format.html { redirect_to items_path }
      end
      return
    end

    @email_is_registered = User.exists?(email: @order.email)
    
    client = DogecoinClient.new

    if client.valid?
      @doges_deposited = client.get_received_by_address(@order.doge_address, 0)
      @doges_pending = @order.total_doges - @doges_deposited
      @doges_pending = 0 if @doges_pending < 0
      @is_payed = @doges_pending == 0
    else
      @doges_deposited = "Error, no address generated. Please contact support."
      @doges_pending = 0
      @is_payed = false
    end
  
  end

  # GET /orders/new
  def new
    # Public method
    session[:cart] ||= {}

    @current_coupon = get_current_coupon

    @shipping_type = ShippingType.first
    #@shipping_type = get_shipping_type
    #if !@shipping_type
    #  respond_to do |format|
    #    format.html { redirect_to shipping_selector_path }
    #  end
    #  return
    #end
    
    @subtotal_doges = 0
    @total_grams = 0

    @cart_items = get_cart_items
    @cart_items.each do |cart_item|
      @subtotal_doges += cart_item[:item].doges * cart_item[:amount]
      @total_grams += cart_item[:item].grams * cart_item[:amount]
    end

    if @current_coupon
      @subtotal_doges = apply_discount(@subtotal_doges, @current_coupon.discount)
    end

    @shipping_doges = (@total_grams/1000.0 * @shipping_type.doges_per_kilo).ceil
    @total_doges = @subtotal_doges + @shipping_doges

    @order = Order.new
    if current_user
      @last_order = Order.where(email: current_user.email).last
      if @last_order
        @first_name_stored = @last_order.first_name
        @last_name_stored = @last_order.last_name
        @postal_code_stored = @last_order.postal_code
        @shipping_address_stored = @last_order.shipping_address
      end
    end
  end
  # GET /orders/1/edit
  def edit
    # Admin only
    if !current_user_is_admin
      respond_to do |format|
        format.html { redirect_to items_path }
      end
      return
    end
  end

  # POST /orders
  # POST /orders.json
  def create
    # Public method

    @order = Order.new(order_params)

    @current_coupon = get_current_coupon

    @shipping_type = ShippingType.first
    #@shipping_type = get_shipping_type
    #if !@shipping_type
    #  respond_to do |format|
    #    format.html { redirect_to shipping_selector_path }
    #  end
    #  return
    #end

    if current_user
      @order.email = current_user.email
    end

    @order.traking_info = "Processing"
    @order.shipping_type_id = @shipping_type.id
    @order.secure_hash = SecureRandom.urlsafe_base64(69).gsub(/-|_/,('a'..'z').to_a[rand(26)])
    
    client = DogecoinClient.new
    if client.valid?
      @order.doge_address = client.get_new_address
    end

    if(OrderState.first)
      @order.order_state_id = OrderState.first.id
    end
    @order.subtotal_doges = 0
    total_grams = 0
    cart_items = get_cart_items
    cart_items.each do |cart_item|
      @order.subtotal_doges += cart_item[:item].doges * cart_item[:amount]
      total_grams += cart_item[:item].grams * cart_item[:amount]
    end

    if @current_coupon
      @order.subtotal_doges = apply_discount(@order.subtotal_doges, @current_coupon.discount)
    end

    @order.shipping_doges = (total_grams/1000.0 * @shipping_type.doges_per_kilo).ceil
    @order.total_doges = @order.subtotal_doges + @order.shipping_doges

    respond_to do |format|
      if @order.save
        cart_items.each do |cart_item|
          OrderItem.create(order_id: @order.id, item_id: cart_item[:item].id, amount: cart_item[:amount], doges: cart_item[:item].doges)
        end

        #MainMailer.order_created_email(@order).deliver
        if @order.email && @order.email != ""
          MainMailer.order_created_email(@order).deliver
        end
        MainMailer.admin_order_notification_email(@order).deliver
        
        clear_session_cart

        format.html { redirect_to order_path(@order, secure_hash: @order.secure_hash), notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { redirect_to new_order_path }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    # Admin only
    if !current_user_is_admin
      respond_to do |format|
        format.html { redirect_to items_path }
      end
      return
    end

    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    # Admin only
    if !current_user_is_admin
      respond_to do |format|
        format.html { redirect_to items_path }
      end
      return
    end

    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:email, :shipping_type_id, :traking_info, :first_name, :last_name, :postal_code, :shipping_address, :order_state_id, :doge_address, :subtotal_doges, :shipping_doges, :total_doges)
    end
end
