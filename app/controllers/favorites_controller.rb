class FavoritesController < ApplicationController
  def create
    Favorite.create(user_id: params[:favorite][:user_id], palindrome_id: params[:favorite][:palindrome_id])
    redirect_to palindromes_url
  end

  def destroy
    favorite = Favorite.find params[:id]
    favorite.destroy
    redirect_to palindromes_url
  end

  def index
    @favorites = Favorite.where(user_id: current_user.id).to_a
  end
end
