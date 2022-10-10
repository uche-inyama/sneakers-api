class ProductsController < ApplicationController
  before_action :set_product, only: [:edit, :show, :update, :destroy]
  
  def index
    @products = Product.all
    respond_to do |format|
      format.html 
      format.json { render json: @products }
    end
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)
    respond_to do |format|
      if @product.save
        format.html { redirect_to products_path, notice: 'Product created successfully' }
        format.json { render json: @product }
      else
        format.json { render json: :unprocessable_entity }
      end
    end
  end

  def show
    if @product
      respond_to do |format|
        format.html 
        format.json { render json: @product}
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        format.json { render json: @product }
        format.html { redirect_to products_path, notice: 'Product successfully updated.' }
      else
        format.json { render json: :unprocessable_entity }
      end
    end
  end

  def destroy
    @product.destroy
    respond_to do |format|
        format.turbo_stream { flash.now[:notice] = 'Product has been removed.'}
        format.html { redirect_to products_path, notice: 'Product deleted successfully' }
      format.json { head :no_content }
    end
  end

  def product_params
    params.require(:product).permit(:name, :marketing_statement, :product_price, :product_discount)
  end

  def set_product
    @product = Product.find(params[:id])
  end

  private :product_params, :set_product
end
