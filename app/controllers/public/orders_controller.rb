class Public::OrdersController < ApplicationController
  def new
    @order=Order.new
  end

  def confirmation
     @cart_items=current_customer.cart_items
     @total=0
     @cart_items.each do |cart|
      @total = @total + cart.sum_of_price
     end
     @order = Order.new(order_params)
     @order.postage=800
    if params[:order][:select_address]=="0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name
    elsif params[:order][:select_address]=="1"
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    else
    end
  end

  def create
   @order=Order.new(order_params)
   @order.customer_id=current_customer.id
   @order.save
   @cart_items=current_customer.cart_items
   @cart_items.each do |cart_item|
    @order_product=OrderProduct.new
    @order_product.item_id=cart_item.item_id
    @order_product.order_id=@order.id
    @order_product.price=cart_item.item.price
    @order_product.amount=cart_item.amount
    @order_product.save
    end
    @cart_items.destroy_all
   redirect_to  orders_completion_path
  end

  def completion
  end

  def index
   @orders=current_customer.orders
  end

  def show
    @order=Order.find(params[:id])
  end


  private
  def order_params
   params.require(:order).permit(:payment_method,:postal_code, :address, :name,:postage,:total_payment)

  end

end
