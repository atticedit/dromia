class PalindromesController < ApplicationController
  before_filter :load_palindromes

  def index
    @palindrome = Palindrome.new
  end

  def create
    palindrome_params = params.require(:palindrome).permit(:body)
    @palindrome = Palindrome.new(palindrome_params)
    if @palindrome.save
      flash[:notice] = "Your palindrome has been submitted"
      redirect_to palindromes_path
    else
      flash[:alert] = "Your palindrome couldn't be submitted. #{@palindrome.errors.full_messages.join(" ")}"
      render :index
    end
  end

  private

  def load_palindromes
    @palindromes = Palindrome.all
  end
end