class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    set_product
  end

  def new
    @product = Product.new
  end

  def create
    product = Product.create(product_params)
    product.save
    redirect_to products_path
  end

  def inventory
    set_product
    render plain: @product.inventory > 0 ? true : false
  end

  def description
    set_product
    render plain: @product.description
  end

  private
  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :price, :inventory, :description)
  end
end
