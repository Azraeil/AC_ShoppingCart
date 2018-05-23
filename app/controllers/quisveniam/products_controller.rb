class Quisveniam::ProductsController < ApplicationController
  def index
    @products = Product.all
  end
end
