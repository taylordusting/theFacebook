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

Then(/^I should see Sign in$/) do
  pending # express the regexp above with the code you wish you had
end

Given /^I am logged in$/ do
  #email = 'samuel.beckett@colorado.edu'
  #password = 'password'
  @user = User.create(name: "Example User", email: "user@example.com", password: "foobar", password_confirmation: "foobar", 
                      quotes: "xyz", interests: "foobar")
  visit '/signin'
  fill_in "Email",    with: @user.email
  fill_in "Password", with: @user.password
  click_button "Sign in"
end

When /^(?:|I )press "([^\"]*)"$/ do |button|
    click_button(button)
end

#And /^(?:|I )am on (.+)$/ do |page_name|
#  visit path_to(page_name)
#end


When /^(?:|I )press "([^\"]*)"$/ do |button|
  click_button(button)
end

When /^(?:|I )follow "([^\"]*)"$/ do |link|
  #visit path_to(link)
  click_link(link)
end

Then /^I should see "(.*)"$/ do |e1|
	page.body =~ /#{e1}/m ? nil : raise("Not working")
end

Given /^I visit the signup page$/ do
  visit signup_path
end

When /^I submit valid signup information$/ do
  fill_in "Name",     with: "Example User"
  fill_in "Email",    with: "user@example.com"
  fill_in "Password", with: "foobar"
  fill_in "Confirmation", with: "foobar"
  click_button "Create my account"
end

Then /^I should see the profile page$/ do
  expect(page).to have_title("Example User")
end

Then /^I should see the signout link$/ do
  expect(page).to have_link('Sign out', href: signout_path)
end

Then(/^I should be on the Sign Up page$/) do
  expect(page).to have_content(@user.name)
end

When(/^I sign in$/) do
  fill_in "Email",    with: @user.email
  fill_in "Password", with: @user.password
  click_button "Sign in"
end

When(/^I click a user's profile name$/) do
  all(:xpath, "//a[@href='/users/1']")[1].click
  #page.all(:link, "Dustin Taylor")[0].click #click first href link on page
end

Then(/^I should see their Wall$/) do
  expect(page).to have_content("Wall")
end

And /^I click the Users button$/ do
  click_link("Users")
end

Then /^I should see All users$/ do
  expect(page).to have_content("All users")
end

When /^I click My Profile$/ do
  click_link("My Profile")
end

When /^I click Update Profile Info$/ do
  click_link("Update Profile Info")
end

Then(/^I fill in "(.*?)" with "(.*?)"$/) do |arg1, arg2|
  fill_in arg1, with: arg2
end

When(/^I click "(.*?)" the page should reload with the updated information$/) do |arg1|
  click_button(arg1)
  #(@user.quotes).should equal("xyz")
end

Then(/^I can see my Interests$/) do
  expect(page).to have_content("Interests")
end

Then(/^I can see my Quotes$/) do
  expect(page).to have_content("Quotes")
end

Then(/^I can see my Wall$/) do
  expect(page).to have_content("Wall")
end

And(/^I go to the profile preferences page$/) do
  visit_path_to('profilepreferences')
end

# -------------------------- PENDING -------------------------- #

And(/^the fields should be filled in with the updated information$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should be able to edit my Interests$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should be able to edit my Quotes$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see my News Feed$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^that I am logged in$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see a list of my friends$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^an option to unfriend people$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^I am friends with someone$/) do
  pending # express the regexp above with the code you wish you had
end