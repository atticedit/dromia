Feature: Authenticate the user
  As a user
  I want to be able to sign up/sign in/sign out

  - Standard email/password signup without email confirmation
  - Standard password reset via email
  - Standard login/logout

  Scenario: User can sign up with username and email and password
    Given I am on the homepage

    When I click "Sign Up"
      And I fill in "Username" with "ada"
      And I fill in "Email" with "ada@email.com"
      And I fill in "Password" with "bernoullicalculations"
      And I fill in "Password confirmation" with "bernoullicalculations"
      And I press "Sign up"
    Then I should see "Welcome! You have signed up successfully."
      And I should see "Sign Out"
      And I should not see "Sign In"
      And I should not see "Sign Up"

    When I click "Sign Out"
    Then I should see "Sign In"
      And I should not see "Sign Out"

  Scenario: User can sign up with username, log out, and log in with username
    Given I am on the homepage

    When I click "Sign Up"
      And I fill in "Username" with "george"
      And I fill in "Email" with "george@email.com"
      And I fill in "Password" with "booleanalgebra"
      And I fill in "Password confirmation" with "booleanalgebra"
      And I press "Sign up"
    Then I should see "Welcome! You have signed up successfully."

    When I click "Sign Out"
      And I click "Sign In"
      And I fill in "Email / Username" with "george"
      And I fill in "Password" with "booleanalgebra"
      And I press "Sign in"
    Then I should see "Signed in successfully."

  Scenario: User can log in with email
    Given the user "george"/"george@email.com" with password of "booleanalgebra"
      And I am on the homepage

    When I click "Sign In"
      And I fill in "Email / Username" with "george@email.com"
      And I fill in "Password" with "booleanalgebra"
      And I press "Sign in"
    Then I should see "Signed in successfully."
      And I should see "Sign Out"
      And I should not see "Sign In"

  Scenario: User can log in with username
    Given the user "george"/"george@email.com" with password of "booleanalgebra"
      And I am on the homepage

    When I click "Sign In"
      And I fill in "Email / Username" with "george"
      And I fill in "Password" with "booleanalgebra"
      And I press "Sign in"
    Then I should see "Signed in successfully."
