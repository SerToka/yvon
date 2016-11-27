class OrdersController < ApplicationController
  before_action :find_restaurant, only: [ :index, :show, :edit, :update ]
  before_action :find_order, only: [ :edit, :update ]

  def index
    @orders = @restaurant.orders.all
  end

  def show
  end

  def edit
  end

  def update
    @order.update(order_params)
    if @order.save
      # if order_params[:delivered_at]
      #   Facebook::Messenger::Bot.deliver({
      #     recipient: {
      #       id: @order.user.messenger_id
      #     },
      #     message: {
      #       text: "#{@order.user.first_name}, you picked up your order at #{@order.restaurant.name}. Can I help you for something else?",
      #       quick_replies: [
      #         {
      #           content_type: 'location'
      #         }
      #       ]
      #     }},
      #     access_token: ENV['ACCESS_TOKEN']
      #   )

      # else
      #   Facebook::Messenger::Bot.deliver({
      #     recipient: {
      #       id: @order.user.messenger_id
      #     },
      #     message: {
      #       text: "Hey #{@order.user.first_name}, your order at #{@order.restaurant.name} is ready for pick-up!"
      #     }},
      #     access_token: ENV['ACCESS_TOKEN']
      #   )
      # end
      @orders = @restaurant.orders.all
      respond_to do |format|
        format.html { redirect_to restaurant_path(@restaurant) }
        format.js
      end
    end
  end

  private

  def find_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def find_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:ready_at, :delivered_at)
  end

end


