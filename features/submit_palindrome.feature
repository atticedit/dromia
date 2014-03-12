Feature: Submit a palindrome
  As someone who enjoys coming up with palindromes
  I want to submit a palindrome I've created
  in order to share my creation where it might be appreciated

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
    Then I should see "Your submission couldn't be accepted. Body can't be blank."

  Scenario: User can submit a non-original and unique palindrome with a body
    Given I'm signed in as "lois"

    When I fill in "Enter your palindrome" with "Do geese see God?"
      And I press "Submit"
    Then I should see "Your palindrome has been submitted"
      And I should see "Do geese see God? | submitted by: lois" within the palindrome display area

  Scenario: User can submit an original and unique palindrome with a body
    Given I'm signed in as "tommy"

    When I fill in "Enter your palindrome" with "Dr. Awkward"
      And I check the box with an id of "palindrome_original"
      And I press "Submit"
    Then I should see "Your palindrome has been submitted"
      And I should see "Dr. Awkward | original | submitted by: tommy" within the palindrome display area

  Scenario: User can't submit a palindrome twice
    Given I'm signed in as "douglas"

    When I fill in "Enter your palindrome" with "Marge lets Norah see Sharon's telegram"
      And I press "Submit"
    Then I should see "Your palindrome has been submitted"
      And I should see "Marge lets Norah see Sharon's telegram | submitted by: douglas" within the palindrome display area

    When I fill in "Enter your palindrome" with "Marge lets Norah see Sharon's telegram"
      And I press "Submit"
    Then I should see "Your submission couldn't be accepted. Body already exists on Dromia."

  Scenario: User can't submit a palindrome a second time with different capitalization
    Given I'm signed in as "gottlob"

    When I fill in "Enter your palindrome" with "Detartrated"
      And I press "Submit"
    Then I should see "Your palindrome has been submitted"
      And I should see "Detartrated | submitted by: gottlob" within the palindrome display area

    When I fill in "Enter your palindrome" with "detartrated"
      And I press "Submit"
    Then I should see "Your submission couldn't be accepted. Body already exists on Dromia."

  Scenario: User can't submit a palindrome already submitted by another user
    Given I'm signed in as "grace"

    When I fill in "Enter your palindrome" with "Amy, must I jujitsu my ma?"
      And I press "Submit"
    Then I should see "Your palindrome has been submitted"
      And I should see "Amy, must I jujitsu my ma? | submitted by: grace" within the palindrome display area

    When I click "Sign Out"
      And I'm signed in as "vannevar"
      And I fill in "Enter your palindrome" with "Amy, must I jujitsu my ma?"
      And I press "Submit"
    Then I should see "Your submission couldn't be accepted. Body already exists on Dromia."

  Scenario: User can't make a non-palindromic submission
    Given I'm signed in as "vint"

    When I fill in "Enter your palindrome" with "Oreo"
      And I press "Submit"
    Then I should see "Your submission couldn't be accepted. Ignoring punctuation and spaces, the characters should be exactly the same backwards and forwards."
