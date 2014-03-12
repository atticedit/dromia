@wip
Feature: Handle the user's favorite palindromes
  As a palindrome fan
  I want to mark palindromes I enjoy
  in order to keep track of my favorites

  Scenario: User who isn't logged in doesn't see the favoriting buttons
    Given there is the palindrome "Mom" submitted by cuthbert
      And I am on the homepage

    Then I should see "Mom" within the palindrome display area
      And I should not see a "Favorite" button
      And I should not see an "Unfavorite" button

  Scenario: User favorites a palindrome
    Given I'm signed in as "edsger"
      And there is the palindrome "Nurses run" submitted by kristen
      And I am on the homepage

    When I press "Favorite"
    Then I should see a "Unfavorite" button
      And I should not see an "Favorite" button

  Scenario: User unfavorites a palindrome
    Given I'm signed in as "cuthbert"
      And there is the palindrome "Madam" submitted by edsger
      And I am on the homepage

    When I press "Favorite"
      And I press "Unfavorite"
    Then I should see a "Favorite" button
      And I should not see an "Unfavorite" button

  Scenario: User views their favorite palindromes
    Given I'm signed in as "kristen"
      And there is the palindrome "Level" submitted by cuthbert
      And I am on the homepage

    When I press "Favorite"
      And I click "Sign Out"

    Given I'm signed in as "kristen"
      And there is the palindrome "Eye" submitted by edsger
      And I am on the homepage

    When I am on the favorites page
    Then I should see "Level"
      And I should not see "Eye"
