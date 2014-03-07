Feature: Submit a palindrome
  As someone who enjoys coming up with palindromes
  I want to submit a palindrome I've created
  in order to share my creation where it might be appreciated.

  Background:
    Given I am on the homepage

    Then I should see "Enter your palindrome"

  Scenario: Trying to submit a blank palindrome fails
    When I press "Submit"
    Then I should see "Your palindrome couldn't be submitted. Body can't be blank"

  Scenario: Submitting a non-original palindrome with a body succeeds
    When I fill in "Enter your palindrome" with "Do geese see God?"
      And I press "Submit"
    Then I should see "Your palindrome has been submitted"
      And I should see "Do geese see God?" within the palindrome display area

  Scenario: Submitting an original palindrome with a body succeeds
    When I fill in "Enter your palindrome" with "Dr. Awkward"
      And I check the box with an id of "palindrome_original"
      And I press "Submit"
    Then I should see "Your palindrome has been submitted"
      And I should see "Dr. Awkward (original)" within the palindrome display area
