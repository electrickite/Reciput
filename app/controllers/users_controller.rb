class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update]

  # GET /users/1/edit
  def edit
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to edit_user_path(@user), notice: 'User was successfully updated.' }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
      authorize @user
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      user_params = params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
