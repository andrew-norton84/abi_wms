module ProductHelper

  def get_prodcode(prodcode)
    Product.find_by(product: prodcode)
  end

end
