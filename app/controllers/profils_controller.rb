class ProfilsController < ApplicationController
  def index
    @profils = Profil.all
  end

  def show
    @profil = Profil.find(params[:id])
    @restrictions = Restriction.all
    @diets = Diet.all
    @targets = Target.all


    @user = current_user
    @profils = @user.profils
    @profil = @user.profils.find(params[:id])
    @avatar = Avatar.find(@profil.avatar_id)
  end

  def update_profil_restrictions
    @profil = Profil.find(params[:id])
    @profil.restrictions = Restriction.where(id: params[:restriction_ids])
    if @profil.save
      redirect_to @profil
    else
      @restrictions = Restriction.all
      render :show
    end
  end

  def update
    @profil = Profil.find(params[:id])

    if @profil.update(profil_params)
      redirect_to @profil
    else
      @diets = Diet.all
      @targets = Target.all
      render :show
    end
  end

  private

  def set_profil
    @profil = Profil.find(params[:id])
  end

  def profil_params
    params.require(:profil).permit(:diet_id, :target_id)
  end
end
