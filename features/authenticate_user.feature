Feature: Authenticate the user
  As a user
  I want to be able to sign up/sign in/sign out

  - Standard email/password signup without email confirmation
  - Standard password reset via email
  - Standard login/logout

  Scenario: User signs up with email and password
    Given I am on the homepage
      And I click "Sign Up"
      And I fill in "Email" with "ada@email.com"
      And I fill in "user_password" with "password"
      And I fill in "Password confirmation" with "password"

    When I press "Sign up"
    Then I should see "Welcome! You have signed up successfully."
      And I should see "Sign Out"
      And I should not see "Sign In"
      And I should not see "Sign Up"

    When I click "Sign Out"
    Then I should see "Sign In"
      And I should not see "Sign Out"

  Scenario: User logs in and logs out
    Given the user "ada@email.com" with "password"
      And I am on the homepage

    When I click "Sign In"
      And I fill in "Email" with "ada@email.com"
      And I fill in "Password" with "password"
      And I press "Sign in"
    Then I should see "Signed in successfully."
      And I should see "Sign Out"
      And I should not see "Sign In"
      And I should not see "Sign Up"

    When I click "Sign Out"
    Then I should see "Sign In"
      And I should not see "Sign Out"
