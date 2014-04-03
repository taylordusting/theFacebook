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
	visit path_to('home')
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
