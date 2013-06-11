require_relative 'helper/ExcelReader'
require 'yaml'
include ExcelReader
LOCATOR = YAML.load_file("config/locators.yml")

Given(/^(.*?)" User visits "(.*?)$/) do |userType, page|
  visit ENV_URL

  sleep 5
 end

When(/^User clicks "(.*?)" to Login$/) do |button|
  find(LOCATOR['login']).click
 end

When(/^"(.*?)" User fills right "(.*?)"$/) do |userType,field|
  email=getUser userType.capitalize
  if field=='email'
      fill_in 'user[email]',:with => email
  else
      fill_in 'user[password]',:with => '12345678'
  end
end

When(/^User clicks New word button$/) do
  find(LOCATOR['new_word']).click 
end

When(/^User types "(.*?)" and clicks "(.*?)" button$/) do |word, addWord|
  $word=word
  fill_in 'phrase', :with => word
  click_link 'Add word'
end

Then(/^User gets number of people who added this word$/) do
  count = find(LOCATOR['number_of_pp']).text
  should have_content("#{count} people added this word")
end

Then(/^User gets "(.*?)" translation$/) do |translation|
  find(LOCATOR['translation'],:text=> translation)
end

Then(/^User gets: Main list as target list$/) do
  find(LOCATOR['main_list'],:text=> 'Main list')
end

Then(/^User is redirected to the same page, but with yellow successful message$/) do
 find(LOCATOR['yellow_alert'],:text=> "New word #{$word} is now added to Main list list")
 debugger
 find(LOCATOR['ok']).click
end

When(/^User clicks "(.*?)" from the menu$/) do |list_Menu|
  find(LOCATOR['list_menu']).click
end

Then(/^User gets "(.*?)" "(.*?)" pair on the list$/) do |word, gato|
  find(LOCATOR['memo_word_value'],:text=> word)
  should have_css(LOCATOR['memo_word_definition'])
end
