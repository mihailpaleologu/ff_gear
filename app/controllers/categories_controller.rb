class CategoriesController < ApplicationController
  before_action :set_category, only: [:show]
  def show
    @posts = @category.posts.near(location_address, 50).
      paginate(page: params[:page])

    respond_to do |format|
      if params[:page]
        format.js { render file: 'market/index' }
      else
        format.js { render file: 'market/show' }
      end
    end
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end
end
