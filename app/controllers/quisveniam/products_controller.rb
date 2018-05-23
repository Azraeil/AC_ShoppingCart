class Quisveniam::ProductsController < Quisveniam::BaseController
  def index
    @products = Product.all
  end
end
