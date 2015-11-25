class CategoriesController < ApplicationController
    before_action :set_category, :only => [ :edit, :update, :destroy]
  def index
    @categories = Category.all
  end
  
  def new
    @category = Category.new
  end
  def create
    @category = Category.new(category_params)
    if @category.save
      #redirect_to :action => :index
      redirect_to categories_url
    else
      render :action => :new
    end
    flash[:notice] = "category was successfully created"
  end

  def edit
    #@category = category.find(params[:id])
  end
  def update
    #@category = category.find(params[:id])
    if @category.update(category_params)
      #redirect_to :action => :show, :id => @category
      redirect_to categories_url
    else
      render :action => :edit
    end
    flash[:notice] = "category was successfully updated"
  end
  
  def destroy
    #@category = category.find(params[:id])
    @category.destroy
  
    #redirect_to :action => :index
    redirect_to categories_url
    flash[:alert] = "category was successfully deleted"
  end
  
  #private以下的所有方法都會變成private方法，所以記得放在檔案的最底下。
  private
  
  def category_params
    params.require(:category).permit(:cname, :status)
  end
  
  def set_category
    @category = Category.find(params[:id])
  end
end
