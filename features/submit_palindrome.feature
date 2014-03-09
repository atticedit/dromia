Feature: Submit a palindrome
  As someone who enjoys coming up with palindromes
  I want to submit a palindrome I've created
  in order to share my creation where it might be appreciated.

  Background:
    Given I am on the homepage

  Scenario: User isn't logged in
    Then I should see "Sign in or Sign up to submit a palindrome"
      And I should not see "Enter your palindrome"

  Scenario: User who's logged in isn't prompted to log in
    Given I'm signed in as "emil"

    Then I should see "Enter your palindrome"
      And I should not see "Sign in or Sign up to submit a palindrome"

 Scenario: User can't submit a blank palindrome
    Given I'm signed in as "bertrand"

    When I press "Submit"
    Then I should see "Your palindrome couldn't be submitted. Body can't be blank."

  Scenario: User can submit a non-original palindrome with a body
    Given I'm signed in as "lois"

    When I fill in "Enter your palindrome" with "Do geese see God?"
      And I press "Submit"
    Then I should see "Your palindrome has been submitted"
      And I should see "Do geese see God? | submitted by: lois" within the palindrome display area

  Scenario: User can submit an original palindrome with a body
    Given I'm signed in as "tommy"

    When I fill in "Enter your palindrome" with "Dr. Awkward"
      And I check the box with an id of "palindrome_original"
      And I press "Submit"
    Then I should see "Your palindrome has been submitted"
      And I should see "Dr. Awkward | original | submitted by: tommy" within the palindrome display area
