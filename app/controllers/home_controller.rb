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
  
  def product
    @products = Product.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @products }
    end
  end
end
