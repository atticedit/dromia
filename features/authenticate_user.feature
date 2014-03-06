@wip
Feature: Authenticate the user
  As a user
  I want to be able to sign up/sign in/sign out

  - Standard email/password signup without email confirmation
  - Standard password reset via email
  - Standard login/logout

  Scenario: User signs up with email and password
    Given I am on the homepage
      And I follow "Sign Up"
      And I fill in "ada@email.com" for "Email"
      And I fill in "password" for "user_password"
      And I fill in "password" for "Password confirmation"
      And I press "Sign up"
    Then I should see "Welcome! You have signed up successfully."
      And I should see "Sign Out"
      And I should not see "Sign In"
      And I should not see "Sign Up"

    When I follow "Sign Out"
    Then I should see "Sign In"
      And I should not see "Sign Out"

  Scenario: User logs in and logs out
    Given the user "ada@email.com" with "password"
      And I am on the homepage
    When I follow "Sign In"
      And I fill in "ada@email.com" for "Email"
      And I fill in "password" for "Password"
      And I press "Sign in"
    Then I should see "Signed in successfully."
      And I should see "Sign Out"
      And I should not see "Sign In"
      And I should not see "Sign Up"

    When I follow "Sign Out"
    Then I should see "Sign In"
      And I should not see "Sign Out"
