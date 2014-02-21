class PalindromesController < ApplicationController
  def index
    @palindromes = Palindrome.all
  end

  def new
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
      render :new
    end
  end
end
