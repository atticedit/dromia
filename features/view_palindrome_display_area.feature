Feature: View the palindrome feed
  In order for the application to be engaging
  As a site visitor
  I want to see palindromes on the homepage

  Scenario: The homepage displays the palindrome feed
    Given the palindrome "Now I draw an award I won"
    Given I am on the homepage
    Then I should see "Now I draw an award I won" within the palindrome display area
