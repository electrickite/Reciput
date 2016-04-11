class WelcomeController < ApplicationController
  def index
    @q = Recipe.order(:name).ransack(params[:q])
    @recipes = @q.result(distinct: true).page(params[:page])
  end
end
