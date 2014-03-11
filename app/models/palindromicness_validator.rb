class PalindromicnessValidator < ActiveModel::Validator
  def validate(palindrome)

    nucleus = palindrome.body.downcase.gsub(/[\s?!;:.,\-–—"']/, "")
    reversed_nucleus = nucleus.each_char.to_a.reverse.join
    unless nucleus == reversed_nucleus
      palindrome.errors.add :base, 'Ignoring punctuation and spaces, the characters should be exactly the same backwards and forwards.'
    end
  end
end
