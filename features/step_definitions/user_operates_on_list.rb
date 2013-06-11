Then(/^user should see the url "(.*?)"$/) do |url|
  current_url.include?(url)==true
end

Then(/^User should see "(.*?)" in the placeholder$/) do |place_holder_txt|
  should have_css("input[id='word_list_name'][placeholder='"+place_holder_txt+"']")
end

When(/^User create "(.*?)" as a new list$/) do |list_name|
  fill_in LOCATOR['list_text_field'], :with=> list_name
  find("input[name='commit']").click
end

Then(/^words on "(.*?)" list in the Your lists menu should be zero$/) do |list|
  count=find(LOCATOR['number_of_words_in_list']).text
  count.to_i.should==0
end

Then(/^User should not see "(.*?)"$/) do |txt|
  should have_no_content(txt)
end

When /^User add new word in the list$/ do
  steps %{
    And User types "cat" and clicks "Add word" button
    When User clicks "Save word" button
  }
end

When(/^User selects word from Main list$/) do
  find(LOCATOR['word_from_main_list']).click
end

When(/^User select "(.*?)" as destination$/) do |list|
  click_link list
  sleep 3
end

Then(/^User should see the moved words in the list$/) do
  find("ul[id='nav_column']>li:nth-child(2)>a").click
  sleep 3
  within("div[id='memo_words_container']") do
    should have_content("cat")
    should have_content("dog")
  end

end

Then(/^User should be on Main List$/) do
  should have_content("Main list")
end
Then /^User should see Start here tip$/ do
  should have_css(LOCATOR['start_here'])
end

When /^User creates a list$/ do
  steps %{
    When User clicks "Lists" from the menu
    And User clicks on "+ Create new list"
    When User create "mylist" as a new list
 }
  find("ul[id='nav_column']>li:nth-child(2)>a").click
  sleep 3
end