Feature: Signing in and Creating an account

Scenario: Signing in
  Given I am on the Facebook homepage
  And I am not logged in
  Then I should see "Sign in" 

Scenario: Sign Up
  Given I am on the Facebook homepage
  And I am not logged in
  When I follow "Sign up now!"
  Then I should see "Sign up"

Scenario: Set up profile page
  Given I am on the Sign Up page
  And I am not logged in
  When I create an account
  Then I should be on the profile page
