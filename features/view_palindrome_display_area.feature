Feature: View the palindrome display area
  In order for the application to be engaging
  As a site visitor
  I want to see palindromes on the homepage

  Scenario: Homepage displays the palindrome display area
    Given the palindrome "Now I draw an award I won" submitted by Alan
      And the palindrome "Senile felines" submitted by Sergei
      And I am on the homepage

    Then I should see "Now I draw an award I won | submitted by: Alan" within the palindrome display area
      And I should see "Senile felines | submitted by: Sergei" within the palindrome display area
