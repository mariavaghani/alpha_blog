class CategoriesController < ApplicationController

  before_action :require_admin, except: [:index, :show]

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
    # @page_name = @category.cat_name
    @article_list = @category.articles.paginate(page: params[:page], per_page: 5 )
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      flash[:notice] = "Category #{@category.cat_name} was updated successfully"
      redirect_to @category
    else
      render 'edit'
    end
  end

  def index
    @page_name = 'Categories'
    @category_list = Category.paginate(page: params[:page], per_page: 5 )
  end

  private

  def require_admin
    if !(logged_in? && current_user.admin?)
      flash[:alert] = "Only admins can perform this action"
      redirect_to categories_path
    end
  end


  def category_params
    params.require(:category).permit(:cat_name)
  end
end
