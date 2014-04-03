Feature: Signed in user

Scenario: Navigate to homepage
  Given I am logged in
  And I am on the home
  Then I should see "News Feed"

Scenario: Profile Page
  Given I am on my profile page
  Then I can see my Interests
  And I can see my Quotes
  And I can see my Wall

Scenario: Profile preferences friends list
  Given I am logged in
  And I go to the profile preferences page
  Then I should see a list of my friends
  And an option to unfriend people

Scenario: Update profile preferences
  Given I am logged in
  And I go to the profile prefrences page
  Then I should be able to edit my Interests
  And I should be able to edit my Quotes
  When I click "Save Changes" the page should reload with the updated information

Scenario: Navigate to other users profile page
  Given I am friends with someone
  When I click their profile name
  Then I should be on their profile page
  And I should see their Wall
