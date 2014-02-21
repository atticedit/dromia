And "show me the page" do
  save_and_open_page
end

When(/^I go to the homepage$/) do
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

Then(/^I should see "(.*?)" within the palindromes display area$/) do |text|
  within(".palindromes") do
    page.should have_content(text)
  end
end

Then(/^there should be a palindrome "(.*?)" in the database$/) do |text|
  palindrome_count = Palindrome.where(body: text).count
  palindrome_count.should == 1
end
