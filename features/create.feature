Feature: Signing in and Creating an account

Scenario: Signing in
  Given I am on the Facebook homepage
  And I am not logged in
  Then I should see "Sign in" 

Scenario: Add account
  Given I am on the Facebook homepage
  And I am not logged in
  When I follow "Sign up now!"
  Then I should see "Sign up"

Scenario: Set up profile page
  Given I visit the signup page
    When I submit valid signup information
    Then I should see the profile page
    And I should see the signout link
