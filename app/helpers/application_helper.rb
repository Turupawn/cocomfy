module ApplicationHelper
  def current_user_is_admin
    # Public method
    return current_user && current_user.is_admin
  end

  def apply_discount item_price, discount
    return (item_price - ((item_price / 100) * discount)).floor
  end
end
