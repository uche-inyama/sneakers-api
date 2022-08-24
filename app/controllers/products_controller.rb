class ProductsController < ApplicationController
  before_action :set_product, only: [:update, :destroy]

  def index
    @products = Product.all
    respond_to do |format|
      format.html 
      format.json { render json: @products }
    end
  end

  def create
    @product = Product.create(product_params)
    if @product.save
      render json: @product
    else
      render json: :unprocessable_entity
    end
  end

  def update
    if @product.update(product_params)
      render json: @product
    else
      render json: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy

    head :no_content
  end

  def product_params
    params.require(:product).permit(:name, :marketing_statement, :product_price, :product_discount)
  end

  def set_product
    @product = Product.find(params[:id])
  end

  private :product_params
end
