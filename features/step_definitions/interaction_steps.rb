Then "show me the page" do
  save_and_open_page
end

Given(/^there is the palindrome "(.*?)" submitted by (.*?)$/) do |body, username|
  user = User.create(email: "#{username}@email.com", username: username, password: "password", password_confirmation: "password")
  Palindrome.create!(body: body, user_id: user.id)
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

Given(/^the user "(.*?)"\/"(.*?)" with password of "(.*?)"$/) do |username, email, password|
  User.create(username: username, email: email, password: password, password_confirmation: password)
end

When(/^I check the box with an id of "(.*?)"$/) do |id|
  find(:css, "##{id}").set(true)
end

Given(/^I'm signed in as "(.*?)"$/) do |username|
  email = "#{username}@email.com"
  User.create(username: username, email: email, password: "password", password_confirmation: "password")
  visit new_user_session_path
  fill_in "Email", with: email
  fill_in "Password", with: "password"
  click_button "Sign in"
  page.should have_content("Signed in successfully")
end

Then(/^I should see (?:a|an) "(.*?)" button$/) do |button_text|
  page.should have_selector("input[value='#{button_text}']")
end

Then(/^I should not see (?:a|an) "(.*?)" button$/) do |button_text|
  page.should_not have_selector("input[value='#{button_text}']")
end

When(/^I am on the favorites page$/) do
  visit favorites_path
end
