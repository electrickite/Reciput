class WelcomeController < ApplicationController
  def index
    @q = policy_scope(Recipe).order(:name).ransack(params[:q])
    @recipes = @q.result(distinct: true).page(params[:page])
  end
end
