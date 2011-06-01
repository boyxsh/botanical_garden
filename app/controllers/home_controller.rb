class HomeController < ApplicationController
  def index
  end

  def popular
    @products = Product.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @products }
    end
  end
  
  def plant
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @products }
    end
  end
  
  def pop_show
    unless params[:id].blank?
      @p = Product.find_by_id params[:id]
      respond_to do |format|
        format.html # index.html.erb
        format.xml  { render :xml => @products }
      end
    end
  end
  
  def product
    @products = Product.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @products }
    end
  end
  
  def order
    @cart_items = Array.new
    unless params[:id].blank?
      @order = Order.find_by_id(params[:id])
      @cart_items = @order.cart_items
    end
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @cart_items }
    end
  end
  
  def remove_item
    unless params[:id].blank?
      cartItem = CartItem.find_by_id(params[:id])
      cartItem.destroy
      redirect_to '/order/'+cartItem.order.id.to_s
    end
  end
  
  def update_item_quantity
    unless params[:quantity].blank? || params[:id].blank?
      cartItem = CartItem.find_by_id(params[:id])
      cartItem.update_quantity_for(params[:quantity])
      render :text => "OK"
    end
  end
end
