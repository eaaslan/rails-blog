class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def new
    @category=Category.new
  end

  def create
    @category= Category.new(category_params)
    if @category.save
      # flash[:notice] = "Category created successfully"
      redirect_to categories_path, flash: { notice: "Category created successfully" }
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end


  private

  def category_params
    # params.require(:category).permit(:title)
    params.expect(category: [ :title ])
  end
end
