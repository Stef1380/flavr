class ProfilsController < ApplicationController
  def index
    @profils = Profil.all
  end

  def show

    @profil = Profil.find(params[:id])
    @avatar = @profil.avatar.url
    @restrictions = Restriction.all
    @diets = Diet.all
    @targets = Target.all
    @user = current_user
    @profils = @user.profils
    @profil = @user.profils.find(params[:id])
    if params[:query].present?
      @ingredient = Ingredient.find_by("name ILIKE ?", "%#{params[:query]}%") || Ingredient.first
    else
      @ingredient = Ingredient.left_joins(:preferences).group(:id).order('COUNT(preferences.like) ASC').first
    end
    @preferences = Preference.includes(:ingredient)
                         .where(profil_id: @profil.id, like: true)
                         .map(&:ingredient)
                         .compact
                         .map(&:name)

    respond_to do |format|
      format.html
      format.text { render partial: "profils/ingredient", locals: {ingredient: @ingredient}, formats: [:html]}
    end
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
    @profil = Profil.new(profil_params)
    @profil.user = current_user
    if @profil.save!
      redirect_to profil_path(@profil)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @profil = Profil.find(params[:id])
    @profil.destroy
    redirect_to profils_path, notice: 'Le profil a été supprimé.'
  end

  private

  def profil_params
    params.require(:profil).permit(:avatar_id, :username, :sexe, :age, :diet_id, :target_id, :photo, restriction_ids: [])

  end
  def set_profil
    @profil = Profil.find(params[:id])
  end
end
