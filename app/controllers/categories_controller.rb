class CategoriesController < ApplicationController
  before_action :require_admin, except: [:index, :show]
  before_action :category_set, only: [:show, :destroy, :edit, :update]
  def index
    @categories = Category.paginate(page: params[:page], per_page: 5)
  end
  
  def new
    @category = Category.new
  end
  
  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "Category has successfully been created"
      redirect_to categories_path
    else
      render 'new'
    end
  end
  def edit
  
  end
  def update
    if @category.update(category_params)
      flash[:success] = "#{@category.name} category has been successfully updated"
      redirect_to categories_path
    else
      render 'edit'
    end
  end
  def show
    @category_articles = @category.articles.paginate(page: params[:page], per_page: 5).order("updated_at DESC")
  end
  
  def destroy
    @category.destroy
    flash[:danger] = "Category has been deleted"
    redirect_to categories_path(@category)
  end
 private
  def category_params
    params.require(:category).permit(:name)
  end
  def require_admin
    if !logged_in? || (logged_in? && !current_user.admin?)
      flash[:danger] = "Only admins can perform this action"
      redirect_to categories_path
    end
  end
  def category_set
   @category = Category.find(params[:id])
  end
   
  
 
end
