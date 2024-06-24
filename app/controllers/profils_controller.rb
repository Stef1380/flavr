class ProfilsController < ApplicationController
  def index
    @profils = Profil.all
  end
  def show
    @avatar = Avatar.find(params[:id])
    @profil = Profil.find(params[:id])
    @restrictions = Restriction.all
    @diets = Diet.all
    @targets = Target.all
    @user = current_user
    @profils = @user.profils
    @profil = @user.profils.find(params[:id])
  end
  def new
    @avatars = Avatar.all
    @profil = Profil.new
    @diets = Diet.all
    @restrictions = Restriction.all
    @targets = Target.all
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
  def create
    @profil = Profil.new(profile_params)
    @profil.user = current_user
    if @profil.save!
      redirect_to profil_path(@profil), notice: 'Profil créé avec succès.'
    else
      render :new, status: :unprocessable_entity
    end
  end
  private
  def profile_params
    params.require(:profil).permit(:avatar_id, :username, :sexe, :age, :diet_id, :target_id, :photo, restriction_ids: [])
  end
  def set_profil
    @profil = Profil.find(params[:id])
  end
end
