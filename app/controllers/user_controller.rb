class UserController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = current_user
    @first_name = @user.first_name == nil ? 'Prenom' : @user.first_name
    @last_name = @user.last_name == nil ? 'Nom' : @user.last_name
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    user_params = params.require(:user).permit(:first_name, :last_name, :description)
    if @user.update(user_params)
      flash[:success] = "Votre compte a bien été modifié"
      redirect_to user_path(@user.id)
    else
      flash[:error] = "ROLLBACK, erreur sur les champs de modifications"
      render :edit
    end
  end
end
