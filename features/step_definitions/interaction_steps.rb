And "show me the page" do
  save_and_open_page
end

Given(/^the palindrome "(.*?)"$/) do |body|
  Palindrome.create(body: body)
end

Given(/^I am on the sign in page$/) do
  visit new_user_session_path
end

Given(/^I am on the homepage$/) do
  visit root_path
end

When(/^I click "(.*?)"$/) do |link|
  click_link(link)
end

When(/^I press "(.*?)"$/) do |text|
  click_button(text)
end

Then(/^I should see(?::)? "(.*?)"$/) do |text|
  page.should have_content(text)
end

Then(/^I should not see "(.*?)"$/) do |text|
  page.should_not have_content(text)
end

When(/^I fill in "(.*?)" with "(.*?)"$/) do |field, content|
  fill_in(field, with: content)
end

Then(/^I should see "(.*?)" within the palindrome display area$/) do |text|
  within(".palindromes") do
    page.should have_content(text)
  end
end

Given(/^the user "(.*?)" with "(.*?)"$/) do |email, password|
  User.create(email: email, password: password, password_confirmation: password)
end

When(/^I check the box with an id of "(.*?)"$/) do |id|
  find(:css, "##{id}").set(true)
end
