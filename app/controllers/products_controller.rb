class ProductsController < InheritedResources::Base
  before_action :authenticate_user!, :except => [:index, :show]

    
    def index
        @products = Product.all
        @current_user = current_user
    end
   
  private

    def product_params
      params.require(:product).permit(:name, :description, :price)
    end

end
