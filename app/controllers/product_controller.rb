class ProductController < ApplicationController
  def index
    @product = Product.all
    
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to :root
    else
      @product.valid?
      render action: :new
    end
  end

  private
  def product_params
    params.require(:product).permit(:name, :description, :price, :stock).merge(user: current_user)
  end

end
