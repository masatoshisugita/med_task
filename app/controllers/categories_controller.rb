class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    render json: @categories
  end

  def create
    if params[:category_name] == nil #paramsが無い時はエラーを返す
      response_error
      return
    end
    @category = Category.new(category_params)
    @category.name = params[:category_name]
    if @category.save  #categoriesテーブルにcategory_nameが存在しない場合、両方のテーブルに登録
      @idea = @category.ideas.new(idea_params)
      @idea.body = params[:body]
      if @idea.save  #ideasテーブルにも登録
        response_success
      else
        response_error
      end
    else  #categoriesテーブルにcategory_nameが存在する場合、Ideasのみ登録
      @category = Category.find_by(name: params[:category_name])
      @idea = @category.ideas.new(idea_params)
      @idea.body = params[:body]
      if @idea.save
        response_success
      else
        response_error
      end
    end
  end

  private

  def category_params
    params.fetch(:categories, {}).permit(:name)
  end

  def idea_params
    params.fetch(:ideas, {}).permit(:category_id,:body)
  end
end
