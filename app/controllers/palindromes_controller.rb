class PalindromesController < ApplicationController
  before_filter :load_palindromes

  def index
    @palindrome = Palindrome.new
  end

  def create
    @palindrome = current_user.palindromes.new(palindrome_params)
    if @palindrome.save
      flash[:notice] = "Your palindrome has been submitted"
      redirect_to palindromes_path
    else
      flash[:alert] = "Your submission couldn't be accepted. #{@palindrome.errors.full_messages.join(" ")}"
      render :index
    end
  end

  private

  def palindrome_params
    params.require(:palindrome).permit(:body, :original, :user_id)
  end

  def load_palindromes
    @palindromes = Palindrome.order('palindromes.created_at DESC').all
  end

  # favorites feature is a work in progress
  def favorite(palindrome)
    favorite = Favorite.where(user: current_user, palindrome: palindrome).first
    favorite = Favorite.new unless favorite
    favorite
  end
  helper_method :favorite
end
