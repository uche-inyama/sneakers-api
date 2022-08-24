class SamplesController < ApplicationController
  before_action :set_sample, only: [:update, :destroy]
  before_action :set_product, only: [:new, :index, :create]

  def create
    @sample = @product.samples.build(sample_params)
    if @sample.save
      render json: @sample
    else
      render json: :unprocessable_entity
    end
  end

  def update
    if @sample.update(sample_params)
      render json: @sample
    else
      render json: :unprocessable_entity
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