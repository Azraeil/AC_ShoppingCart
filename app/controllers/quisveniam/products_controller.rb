class Quisveniam::ProductsController < Quisveniam::BaseController
  before_action :set_product, only: [:edit, :update, :destroy]

  def index
    @products = Product.page(params[:page]).per(8)
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      flash[:notice] = "Product was created successfully."
      redirect_to quisveniam_products_path
    else
      flash[:alert] = "Product was failed to create."
      render :new
    end
  end

  def edit
    # set_product
  end

  def update
    if @product.update(product_params)
      flash[:notice] = "Update product successfully."
      redirect_to quisveniam_products_path
    else
      flash[:alert] = "Update product successfully."
      render :edit
    end
  end

  def destroy
    if @product.destroy
      flash[:notice] = "Product was deleted successfully."
      redirect_to quisveniam_products_path
    else
      flash[:alert] = "Product was failed to delete!"
      redirect_to quisveniam_products_path
    end
  end

  private
  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :price, :image)
  end
end
