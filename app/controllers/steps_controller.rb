class StepsController < ApplicationController
  include Sortable

  before_action :set_step, only: [:edit, :update, :destroy]
  before_action :set_recipe, only: :new

  # GET /steps/new
  def new
    @step = Step.new(recipe: @recipe)
    authorize @step
  end

  # GET /steps/1/edit
  def edit
  end

  # POST /steps
  # POST /steps.json
  def create
    @step = Step.new(permitted_attributes(Step))
    authorize @step

    respond_to do |format|
      if @step.save
        flash[:html_safe] = true
        format.html { redirect_to @step.recipe, notice: "New step was successfully created. #{view_context.link_to 'Add another?', new_recipe_step_path(@step.recipe)}" }
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
      if @step.update(permitted_attributes(@step))
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

  def set_step
    @step = Step.includes(:recipe).find(params[:id])
    authorize @step
  end

  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end
end
