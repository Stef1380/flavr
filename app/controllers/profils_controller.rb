class ProfilsController < ApplicationController
  def index
    @profils = Profil.all
  end

  def show
    @user = current_user
    @profils = @user.profils
    @profil = @user.profils.find(params[:id])
    @avatar = Avatar.find(@profil.avatar_id)
  end
end
