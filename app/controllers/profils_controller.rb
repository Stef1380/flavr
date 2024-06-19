class ProfilsController < ApplicationController
  def index
    @profils = Profil.all
  end

  def show
    @profil = Profil.find(params[:id])
    @restrictions = Restriction.all
    @diets = Diet.all
  end

  def update_profil_restrictions
    @profil = Profil.find(params[:id])
    @profil.restrictions = Restriction.where(id: params[:restriction_ids])
    if @profil.save
      redirect_to @profil, notice: 'Les restrictions ont été mises à jour.'
    else
      @restrictions = Restriction.all
      render :show
    end
  end

  # def update
  #   puts "Params: #{params.inspect}" # Ligne de débogage
  #   @profil = Profil.find(params[:id])
  #   @profil.diet = profil_params

  def update
    @profil = Profil.find(params[:id])

    if @profil.update(profil_params)
      redirect_to @profil, notice: 'Profil mis à jour avec succès.'
    else
      @diets = Diet.all
      render :show
    end
  end

  private

  def set_profil
    @profil = Profil.find(params[:id])
  end

  def profil_params
    params.require(:profil).permit(:diet_id)
  end

end
