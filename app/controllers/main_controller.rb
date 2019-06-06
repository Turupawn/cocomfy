class MainController < ApplicationController
  def index
    # Public method
    @current_coupon = get_current_coupon
    @featured_items = FeaturedItem.all
    render :layout => 'landing'
    return
  end

  def add_to_cart
    # Public method
    session[:cart] ||= {}
    session[:cart][params[:item_id]] ||= 0
    session[:cart][params[:item_id]] += params[:amount].to_i

    if session[:cart][params[:item_id]] <= 0
      session[:cart].delete(params[:item_id])
    end

    respond_to do |format|
      format.html { redirect_to new_order_path, notice: 'Item added to cart.' }
    end
  end

  def change_cart_item_amount
    # Public method
    session[:cart] ||= {}
    session[:cart][params[:item_id]] ||= 0
    session[:cart][params[:item_id]] = params[:amount].to_i

    if session[:cart][params[:item_id]] <= 0
      session[:cart].delete(params[:item_id])
    end

    respond_to do |format|
      format.html { redirect_to new_order_path, notice: 'Cart item amount changed.' }
    end
  end

  def remove_from_cart
    # Public method
    session[:cart].delete(params[:item_id])

    respond_to do |format|
      format.html { redirect_to new_order_path, notice: 'Item removed from cart.' }
    end
  end

  def shipping_selector
    # Public method
    @params = params
  end

  def select_shipping
    # Public method
    permitted = params.require(:shipping_type).permit(:id)
    session[:shipping_type_id] = permitted[:id].to_i
    respond_to do |format|
      format.html { redirect_to new_order_path, notice: 'Shipping method has changed.' }
    end
  end

  def clear_cart
    # Public method
    clear_session_cart
    respond_to do |format|
      format.html { redirect_to new_order_path, notice: 'The cart has been cleared.' }
    end
  end

  def about
  end

  def contact
  end

  def maintenance
  end
end
