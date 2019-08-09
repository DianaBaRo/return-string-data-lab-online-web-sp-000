class ProductsController < ApplicationController

  def new
    @product = Product.new
  end

  def show

  end

  def create
    @product = Product.create(product_params)
    @product.save

    redirect_to product_path(@product)
  end

  def index
    @products = Product.all
  end

  def description
    @product = Product.find(params[:id])
    render plain: product.description
  end

  def inventory
    @product = Product.find(params[:id])
    render plain: product.inventory > 0? "true" : "false"
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :description, :inventory)
  end

end
