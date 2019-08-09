class ProductsController < ApplicationController

  def new
    @product = Product.new
  end

  def create
    @product = Product.build(product_params)
    @product.save

    redirect_to product_path(@product)
  end

  def index
    @products = Product.all
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :description, :inventory)
  end

end
