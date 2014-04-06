Feature: Signed in user

Scenario: Navigate to homepage
  Given I am logged in
  And I am on the Facebook homepage
  Then I should see "News Feed"

Scenario: Profile Page
  Given I am logged in 
  And I am on my profile page
  When I click My Profile
  Then I can see my Interests
  And I can see my Quotes
  And I can see my Wall

Scenario: Profile preferences friends list
  Given I am logged in
  And I click My Profile
  Then I should see a list of my friends
  And an option to unfriend people

Scenario: Update profile preferences
  Given I am logged in
  And I click Update Profile Info
  Then I fill in "Quotes" with "xyz"
  And I fill in "Interests" with "abc" 
  When I click "Save changes" the page should reload with the updated information

Scenario: Navigate to other users profile page
  Given I am logged in
  And I click the Users button
  Then I should see All users
  When I click a user's profile name
  Then I should see their Wall
