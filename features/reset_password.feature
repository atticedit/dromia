@wip
Feature: Reset the user's password
  As a user
  I want to be able to sign up/sign in/sign out

  - Standard email/password signup without email confirmation
  - Standard password reset via email
  - Standard login/logout

  Background:
    Given the user "charles"/"charles@email.com" with password of "differenceengine"
      And I am on the sign in page

    When I click "Forgot your password?"
      And I fill in "Email" with "charles@email.com"
      And I press "Send me reset password instructions"
    Then "charles@email.com" should receive an email

    When I open the email
    Then I should see "Change my password" in the email body

    When I click "Change my password" in the email body
    Then I should see "Change your password"

  Scenario: User can reset password if password confirmation matches
    When I fill in "New password" with "analyticalengine"
      And I fill in "Confirm new password" with "analyticalengine"
      And I press "Change my password"
    Then I should see "Your password was changed successfully. You are now signed in."

    When I click "Sign Out"
    Then I should see "Sign In"

    When I click "Sign In"
      And I fill in "Email" with "charles@email.com"
      And I fill in "Password" with "analyticalengine"
      And I press "Sign in"
    Then I should see "Signed in successfully."

  Scenario: User can't reset password if password confirmation doesn't match
    When I fill in "New password" with "babbageprinciple"
      And I fill in "Confirm new password" with "principle"
      And I press "Change my password"
    Then I should see "Password confirmation doesn't match Password"
