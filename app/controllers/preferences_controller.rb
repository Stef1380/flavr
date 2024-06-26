class PreferencesController < ApplicationController
  def create_preferences
    @profil = Profil.find(params[:id])
    @ingredient = Ingredient.find(params[:ingredient])

    preference = Preference.find_or_create_by(profil: @profil, ingredient: @ingredient) do |pref|
      pref.like = params[:like]
    end

    # Si l'objet Preference existait déjà, on met à jour l'attribut like
    unless preference.new_record?
      preference.update(like: params[:like])
    end

    @ingredient = Ingredient.left_outer_joins(:preferences).where(preferences: {profil_id: nil}).present? ?
    Ingredient.left_outer_joins(:preferences).where(preferences: {profil_id: nil}).first : Ingredient.last

    respond_to do |format|
      format.html { redirect_to profil_path(@profil) }
      format.text { render partial: "profils/ingredient", locals: {ingredient: @ingredient}, formats: [:html]}
    end
  end
end
