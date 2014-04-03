# Scenario: Sign Up
#   Given I am on the Facebook homepage
#   And I am not logged in
#   When I follow "Sign up now!"
#   Then I should be on the Sign Up page

Given /^(?:|I )am on (.+)$/ do |page_name|
  visit path_to(page_name)
end

And /^I am not logged in$/ do
	visit path_to('home')
end

Given /^I am logged in$/ do
  email = 'samuel.beckett@colorado.edu'
  password = 'password'
  

  visit '/signin'
  fill_in "session_email", :with => email
  fill_in "session_password", :with => password
  click_button "Sign in"
end

#And /^(?:|I )am on (.+)$/ do |page_name|
#  visit path_to(page_name)
#end

When /^(?:|I )press "([^"]*)"$/ do |button|
  click_button(button)
end

When /^(?:|I )follow "([^"]*)"$/ do |link|
  #visit path_to(link)
  click_link(link)
end

Then /^I should see "(.*)"$/ do |e1|
	page.body =~ /#{e1}/m ? nil : raise("Not working")
end


# -------------------------- PENDING -------------------------- #

When(/^I create an account$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should be on the profile page$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^I am signed in$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see my News Feed$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I can see my Interests$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I can see my Quotes$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I can see my Wall$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^that I am logged in$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^I go to the profile preferences page$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see a list of my friends$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^an option to unfriend people$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^the I am logged in$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^I go to the profile prefrences page$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should be able to edit my Interests$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should be able to edit my Quotes$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I click "(.*?)" the page should reload with the updated information$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Given(/^I am friends with someone$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I click their profile name$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should be on their profile page$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see their Wall$/) do
  pending # express the regexp above with the code you wish you had
end

