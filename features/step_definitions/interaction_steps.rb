And "show me the page" do
  save_and_open_page
end

Given(/^the palindrome "(.*?)"$/) do |body|
  Palindrome.create(body: body)
end

Given(/^I am on the homepage$/) do
  visit root_path
end

When(/^I press "(.*?)"$/) do |text|
  click_button(text)
end

Then(/^I should see(?::)? "(.*?)"$/) do |text|
  page.should have_content(text)
end

When(/^I fill in "(.*?)" with "(.*?)"$/) do |field, content|
  fill_in(field, with: content)
end

Then(/^I should see "(.*?)" within the palindrome display area$/) do |text|
  within(".palindromes") do
    page.should have_content(text)
  end
end
