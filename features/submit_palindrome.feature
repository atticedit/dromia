Feature: Submit a palindrome
  As someone who enjoys coming up with palindromes,
  I want to submit a palindrome I've created
  in order to share my creation where it might be appreciated.

  Scenario: Trying to submit a blank palindrome fails
    When I go to the homepage
    Then I should see "Your palindrome"
    When I press "Submit"
    Then I should see "Your palindrome can't be blank"

  Scenario: Submitting a palindrome with a body succeeds
    When I go to the homepage
    Then I should see "Your palindrome"
    When I fill in "Your palindrome" with "Do geese see God?"
    When I press "Submit"
    Then I should see "Your palindrome has been submitted"
    And I should see "Do geese see God?" within the arena
