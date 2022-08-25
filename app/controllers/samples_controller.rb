class SamplesController < ApplicationController
  before_action :set_sample, only: [:update, :destroy]
  before_action :set_product, only: [:new, :index, :create]

  def create
    @sample = @product.samples.build(sample_params)
    respond_to do |format|
      if @sample.save
        format.html { redirect_to products_path, notice: 'sample successfully created.'}
        format.json { render json: @sample }
      else
        format.html { render :new }
        format.json { render json: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @sample.update(sample_params)
        format.html { redirect_to products_path, notice: 'sample successfully updated.'}
        format.json { render json: @sample }
      else
        format.html { render :new }
        format.json { render json: :unprocessable_entity }
      end
    end
  end

  def destroy
    @sample.destroy
    
    head :no_content
  end

 
  def sample_params
    params.require(:sample).permit(:image, :product_id)
  end

  def set_product
    @product = Product.find(params[:product_id])
  end

  def set_sample
    @sample = Sample.find(params[:id])
  end

  private :sample_params, :set_sample
end