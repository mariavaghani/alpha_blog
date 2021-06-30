class CategoriesController < ApplicationController
  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "Category #{@category.cat_name} is successfully added to the app"
      redirect_to @category
    else
      render 'new'
    end
  end

  def show
    @category = Category.find(params[:id])
  end

  def edit

  end

  def update

  end

  def index
    @page_name = 'Categories'
    @category_list = Category.paginate(page: params[:page], per_page: 5 )
  end

  private

  def category_params
    params.require(:category).permit(:cat_name)
  end
end
