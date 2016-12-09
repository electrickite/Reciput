class FoodsController < ApplicationController
  before_action :set_food, only: [:show, :edit, :update, :destroy]

  # GET /foods
  # GET /foods.json
  def index
    @q = policy_scope(Food).order(:name).ransack(params[:q])
    @foods = @q.result(distinct: true).page(params[:page])
  end

  # GET /foods/1
  # GET /foods/1.json
  def show
  end

  # GET /foods/new
  def new
    @food = Food.new
    authorize @food
  end

  # GET /foods/1/edit
  def edit
  end

  # POST /foods
  # POST /foods.json
  def create
    @food = Food.new(permitted_attributes(Food))
    authorize @food

    respond_to do |format|
      if @food.save
        flash[:html_safe] = true
        format.html { redirect_to @food, notice: "Food was successfully created. #{view_context.link_to 'Add another?', new_food_path}" }
        format.json { render :show, status: :created, location: @food }
      else
        format.html { render :new }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /foods/1
  # PATCH/PUT /foods/1.json
  def update
    respond_to do |format|
      if @food.update(permitted_attributes(@food))
        format.html { redirect_to @food, notice: 'Food was successfully updated.' }
        format.json { render :show, status: :ok, location: @food }
      else
        format.html { render :edit }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /foods/1
  # DELETE /foods/1.json
  def destroy
    @food.destroy
    respond_to do |format|
      format.html { redirect_to foods_url, notice: 'Food was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_food
    @food = Food.find(params[:id])
    authorize @food
  end
end
