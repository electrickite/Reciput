class IngredientsController < ApplicationController
  before_action :set_ingredient, only: [:edit, :update, :destroy]
  before_action :set_recipe, only: [:new, :create, :edit, :update]

  # GET /ingredients/new
  def new
    @ingredient = Ingredient.new
    set_ingredient_recipe
    authorize @ingredient
  end

  # GET /ingredients/1/edit
  def edit
  end

  # POST /ingredients
  # POST /ingredients.json
  def create
    @ingredient = Ingredient.new(ingredient_params)
    set_ingredient_recipe
    authorize @ingredient

    respond_to do |format|
      if @ingredient.save
        format.html { redirect_to @ingredient.recipe, notice: "Ingredient was successfully created. #{view_context.link_to 'Add another?', new_recipe_ingredient_path(@recipe)}" }
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
      if @ingredient.update(ingredient_params)
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
    # Use callbacks to share common setup or constraints between actions.
    def set_ingredient
      @ingredient = Ingredient.find(params[:id])
      authorize @ingredient
    end

    def set_recipe
      @recipe = Recipe.find(params[:recipe_id])
    end

    def set_ingredient_recipe
      @ingredient.recipe = @recipe
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ingredient_params
      params.require(:ingredient)
        .permit(:food_id, :amount, :unit, :notes)
        .merge(recipe_id: params[:recipe_id])
    end
end
