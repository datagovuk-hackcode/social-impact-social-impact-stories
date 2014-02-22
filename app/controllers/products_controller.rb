class ProductsController < InheritedResources::Base

  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def show

  end

  def create
    @product = Product.new(product_params)
    respond_to do |format|
      if @product.save
        format.html { redirect_to product_url(@product), notice: 'Product created' }
        format.json { render action: 'show', status: :created, location: @product }
      else
        format.html { render action: 'new' }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to product_url(@product), notice: 'Product was successfully updated.' }
        format.json { render json: @product }
      else
        format.html { render action: 'edit' }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def set_product
      @product = Product.find_by_id(params[:id])
    end

    def product_params
      params.require(:product).permit(
        :name,
        :gtin
      )
    end

end
