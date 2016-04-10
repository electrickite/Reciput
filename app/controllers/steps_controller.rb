class StepsController < ApplicationController
  before_action :set_step, only: [:edit, :update, :destroy]
  before_action :set_recipe, only: [:new, :create, :edit, :update]

  # GET /steps/new
  def new
    @step = Step.new
    set_recipe_on_step
    authorize @step

    if @recipe.steps.present?
      @step.sequence = @recipe.steps.last.sequence + 1
    end
  end

  # GET /steps/1/edit
  def edit
  end

  # POST /steps
  # POST /steps.json
  def create
    @step = Step.new(step_params)
    set_recipe_on_step
    authorize @step

    respond_to do |format|
      if @step.save
        format.html { redirect_to @step.recipe, notice: "New step was successfully created. #{view_context.link_to 'Add another?', new_recipe_step_path(@recipe)}" }
        format.json { render @step, status: :created, location: @step.recipe }
      else
        format.html { render :new }
        format.json { render json: @step.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /steps/1
  # PATCH/PUT /steps/1.json
  def update
    respond_to do |format|
      if @step.update(step_params)
        format.html { redirect_to @step.recipe, notice: 'Step was successfully updated.' }
        format.json { render @step, status: :ok, location: @step.recipe }
      else
        format.html { render :edit }
        format.json { render json: @step.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /steps/1
  # DELETE /steps/1.json
  def destroy
    @step.destroy
    respond_to do |format|
      format.html { redirect_to @step.recipe, notice: 'Step was successfully removed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_step
      @step = Step.find(params[:id])
      authorize @step
    end

    def set_recipe
      @recipe = Recipe.find(params[:recipe_id])
    end

    def set_recipe_on_step
      @step.recipe = @recipe
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def step_params
      params.require(:step)
        .permit(:directions, :sequence)
        .merge(recipe_id: params[:recipe_id])
    end
end
