class ProductsController < InheritedResources::Base
  before_action :authenticate_user!, :except => [:index, :show]

    
    def index
        @products = Product.all
        @current_user = current_user
    end

    def show
        @product = Product.find(params[:id])
    end

    def new
        @product = Product.new
    end

    def create
        @product = Product.new(params[:product])
        if @product.save
          flash[:success] = "Product successfully created"
          redirect_to @product
        else
          flash[:error] = "Something went wrong"
          render 'new'
        end
    end

    def edit
        @product = Product.find(params[:id])
    end
    

    def update
        @object = Object.find(params[:id])
        if @object.update_attributes(params[:object])
          flash[:success] = "Object was successfully updated"
          redirect_to @object
        else
          flash[:error] = "Something went wrong"
          render 'edit'
        end
    end

    def destroy
        @product = Product.find(params[:id])
        if @product.destroy
            flash[:success] = 'Product was successfully deleted.'
            redirect_to products_url
        else
            flash[:error] = 'Something went wrong'
            redirect_to products_url
        end
    end
   
  private

    def product_params
      params.require(:product).permit(:name, :description, :price, :nutrionalinformation)
    end

end
