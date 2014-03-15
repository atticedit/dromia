Feature: View the palindrome display area
  In order for the application to be engaging
  As a site visitor
  I want to see palindromes on the homepage

  Scenario: Homepage displays the palindrome display area
    Given there is the palindrome "Now I draw an award I won" submitted by alan
      And there is the palindrome "Senile felines" submitted by sergei
      And I am on the homepage

    Then I should see "Now I draw an award I won" within the palindrome display area
      And I should see "submitted by: alan" within the palindrome display area
      And I should see "Senile felines" within the palindrome display area
      And I should see "submitted by: sergei" within the palindrome display area
