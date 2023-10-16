module CategoriesHelper
  def list
    @categories = Category.all
    render partial: 'shared/categories', locals: { categories: @categories }
  end
end
