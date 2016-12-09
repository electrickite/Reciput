class IngredientsController < ApplicationController
  include Sortable

  before_action :set_ingredient, only: [:edit, :update, :destroy]
  before_action :set_recipe, only: :new
  before_action :find_or_create_food, only: [:create, :update]

  # GET /ingredients/new
  def new
    @ingredient = Ingredient.new(recipe: @recipe)
    authorize @ingredient
  end

  # GET /ingredients/1/edit
  def edit
  end

  # POST /ingredients
  # POST /ingredients.json
  def create
    @ingredient = Ingredient.new(permitted_attributes(Ingredient))
    authorize @ingredient

    respond_to do |format|
      if @ingredient.save
        flash[:html_safe] = true
        format.html { redirect_to @ingredient.recipe, notice: "Ingredient was successfully created. #{view_context.link_to 'Add another?', new_recipe_ingredient_path(@ingredient.recipe)}" }
        format.json { render @ingredient, status: :created, location: @ingredient.recipe }
      else
        format.html { render :new }
        format.json { render json: @ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ingredients/1
  # PATCH/PUT /ingredients/1.json
  def update
    respond_to do |format|
      if @ingredient.update(permitted_attributes(@ingredient))
        format.html { redirect_to @ingredient.recipe, notice: 'Ingredient was successfully updated.' }
        format.json { render @ingredient, status: :ok, location: @ingredient.recipe }
      else
        format.html { render :edit }
        format.json { render json: @ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ingredients/1
  # DELETE /ingredients/1.json
  def destroy
    @ingredient.destroy
    respond_to do |format|
      format.html { redirect_to @ingredient.recipe, notice: 'Ingredient was successfully removed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_ingredient
    @ingredient = Ingredient.includes(:recipe).find(params[:id])
    authorize @ingredient
  end

  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
    authorize @recipe, :update?
  end

  def find_or_create_food
    food_id = params.dig(:ingredient, :food_id)

    unless Food.find_by_id food_id
      food = Food.where('LOWER(name) = ?', food_id.downcase).first || Food.create(name: food_id)
      params[:ingredient][:food_id] = food.id
    end
  end
end
