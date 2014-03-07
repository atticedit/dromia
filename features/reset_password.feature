Feature: Reset the user's password
  As a user
  I want to be able to sign up/sign in/sign out

  - Standard email/password signup without email confirmation
  - Standard password reset via email
  - Standard login/logout

  Background:
    Given the user "babbage@email.com" with "password"
      And I am on the sign in page

    When I click "Forgot your password?"
      And I fill in "user_email" with "babbage@email.com"
      And I press "Send me reset password instructions"
    Then "babbage@email.com" should receive an email

    When I open the email
    Then I should see "Change my password" in the email body

    When I click "Change my password" in the email body
    Then I should see "Change your password"

  Scenario: Password reset with matching password confirmation succeeds
    When I fill in "New password" with "secretive"
      And I fill in "Confirm new password" with "secretive"
      And I press "Change my password"
    Then I should see "Your password was changed successfully. You are now signed in."

    When I click "Sign Out"
    Then I should see "Sign In"

    When I click "Sign In"
      And I fill in "Email" with "babbage@email.com"
      And I fill in "Password" with "secretive"
      And I press "Sign in"
    Then I should see "Signed in successfully."

  Scenario: Trying to reset a password with wrong password confirmation fails
    When I fill in "New password" with "extrasecretive"
      And I fill in "Confirm new password" with "extrasecret"
      And I press "Change my password"
    Then I should see "Password confirmation doesn't match Password"