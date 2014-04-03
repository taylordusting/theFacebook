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
  name = 'Bobby Brown'
  email = 'testing@man.net'
  password = 'secretpass'
  User.new(:name => name, :email => email, :password => password, :password_confirmation => password).save!

  visit '/signin'
  fill_in "user_name", :with => name
  fill_in "user_email", :with => email
  fill_in "user_password", :with => password
  click_button "Sign in"
end

When /^(?:|I )press "([^"]*)"$/ do |button|
  click_button(button)
end

When /^(?:|I )follow "([^"]*)"$/ do |link|
  click_link(link)
end

Then /^I should see "(.*)"$/ do |e1|
	page.body =~ /#{e1}/m ? nil : raise("Not working")
end


When(/^I create an account$/) do
  @user = User.create(name: "Example User", email: "user@example.com", password: "foobar", password_confirmation: "foobar")
end

Then(/^I should be on the profile page$/) do
  expect(page).to have_content(@user.name)
end

When(/^I sign in$/) do
  fill_in "Email",    with: @user.email
  fill_in "Password", with: @user.password
  click_button "Sign in"
end

# -------------------------- PENDING -------------------------- #

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

