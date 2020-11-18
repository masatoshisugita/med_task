class IdeasController < ApplicationController

  def index
    if params[:category_name]  #paramsが指定されている場合、該当するcategoryのideasを返す
      @category = Category.find_by(name: params[:category_name])
      if @category == nil  #paramsの値がcategoriesテーブルにない場合エラーを返す
        not_found_error
        return
      end
      @category_id = @category.id 
      @ideas = Idea.where(category_id: @category_id)
      @new_ideas = @ideas.joins(:category)
        .select("
          ideas.id,
          ideas.body,
          categories.name AS category_name
        ")
      render json: @new_ideas
    else
      @ideas = Idea.joins(:category)  #paramsの指定がない場合、全てのIdeasを返す
      .select("
        ideas.id,
        ideas.body,
        categories.name AS category_name  
        ")
      render json: @ideas
    end
  end
end
