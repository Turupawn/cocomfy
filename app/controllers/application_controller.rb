class ApplicationController < ActionController::Base
  before_action :check_maintenance

  def check_maintenance
    if Setting.maintenance && 
      params[:secret] != Setting.maintenance_secret &&
      !current_user_is_admin &&
      request.fullpath.split("?")[0].gsub("/","") != 'maintenance' &&
      request.fullpath != '/users/sign_in' &&
      request.fullpath != '/users/sign_out' &&
      request.fullpath.split("?")[0].gsub("/","") != 'subscribe' &&
      request.fullpath.split("?")[0].gsub("/","") != 'confirm_subscription' &&
      request.fullpath.split("?")[0].gsub("/","") != 'usubscribe' &&
      request.fullpath.split("?")[0].split("/")[1] != 'orders'
      redirect_to '/maintenance'
    end
  end

  def get_cart_items
    # Public method
    items = []
    session[:cart].each do |item_id, amount|
      item = Item.where(:id => item_id).first
      items.push({item: item, amount: amount})
    end
    return items
  end

  def get_shipping_type
    # Public method
    if session[:shipping_type_id]
      shipping_type = ShippingType.find(session[:shipping_type_id])
      if shipping_type
        return shipping_type
      end
    end
    return nil
  end

  def clear_session_cart
    # Public method
    session.delete(:cart)
  end

  def current_user_is_admin
    # Public method
    return current_user && current_user.is_admin
  end

  def get_current_coupon
    coupon = Coupon.find_by_id(session[:coupon_id])
    if !coupon
      session[:coupon_id] = nil
    end
    return coupon
  end

  def apply_discount item_price, discount
    return (item_price - ((item_price / 100) * discount)).floor
  end

  def is_a_valid_email?(email)
    email_regex = %r{/\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/}xi # Case insensitive
    (email =~ email_regex)
  end
  
  
protected
  def after_sign_up_path_for(resource)
    items_path
  end
  def after_sign_in_path_for(resource)
    if Setting.maintenance
      return orders_path
    end
    items_path
  end
end
