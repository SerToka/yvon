class BotYvon::OrdersController
  def initialize
    @view = BotYvon::OrdersView.new
  end

  def create(message, user, params = {})
    order = user.orders.create({
        located_at: Time.now,
        latitude: params[:lat] || message.attachments[0]['payload']['coordinates']['lat'],
        longitude: params[:lng] || message.attachments[0]['payload']['coordinates']['long']
      })
  end

  def update(postback, user, params = {})
    restaurant = Restaurant.find(params[:restaurant_id])
    unless user.current_order&.restaurant == restaurant
      user.current_order.ordered_meals.destroy_all
      user.current_order.update(restaurant: restaurant)
    end
  end

  def meal_match_restaurant(user, meal)
    user.current_order&.restaurant == meal.restaurant
  end

  def add_meal(user, meal, option = nil)
    current_ordered_meal = user.current_order.ordered_meals.find_by(meal: meal, option: option)
    if current_ordered_meal
      current_ordered_meal.quantity += 1
    else
      current_ordered_meal = user.current_order.ordered_meals.new(meal: meal, option: option)
    end
    current_ordered_meal.save
  end

  def cart(postback, user)
    if user.current_order&.meals.present?
      order = user.current_order
      order.create_elements
      order.reload
      @view.cart(postback, order.decorate)
    else
      @view.no_meals(postback)
    end
  end

  def confirm(postback, user)
    if user.current_order&.meals.present?
      order = user.current_order
      if order.restaurant.on_duty?
        order.preparation_time = order.restaurant.preparation_time
        order.paid_at = Time.now
        order.save
        BotAline::NotificationsController.new.notify_order(order)
        ActionCable.server.broadcast "restaurant_#{order.restaurant.id}",
          order_status: "paid"
        @view.confirm(postback, order.decorate, paid_at: order.paid_at.to_i, program: 'beta')
      else
        @view.restaurant_closed(postback, order.restaurant)
      end
    else
      @view.no_meals(postback)
    end
  end

  def demo(postback, user)
    if user.current_order&.meals.present?
      order = user.current_order
      if order.restaurant.on_duty?
        order.preparation_time = order.restaurant.preparation_time
        order.save
        @view.confirm(postback, order.decorate, paid_at: Time.now.to_i, program: 'demo')
      else
        @view.restaurant_closed(postback, order.restaurant)
      end
    else
      @view.no_meals(postback)
    end
  end
end