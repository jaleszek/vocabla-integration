When /^User selects "(.*?)" translation$/ do |translation_number|
  if(translation_number=='second')
    find(LOCATOR['second_trans']).click
  elsif(translation_number=='third')
    find(LOCATOR['third_trans']).click
  end
  sleep 5
end

Then /^User should not see other translations except "(.*?)"$/ do |trans_number|
  if(trans_number=='second')
    has_content?("go after with the intent").should==true
    has_no_content?("a member of the genus Canis").should==true
  end
end

Then /^User should see "(.*?)" translation$/ do |trans_number|
  if(trans_number=='second')
    has_content?("go after with the intent").should==true
  elsif(trans_number=='third')
    has_content?("follow closely").should==true
  end
end

Then /^User close the test$/ do
  click_link 'Finish test'
  find(LOCATOR['close_test']).click
end

When /^User clicks on change translation image$/ do
  find(LOCATOR['change_translation']).click
end

When /^User delete all the words$/ do
  steps %{
   When User clicks on "Select all"
   And User clicks on "Delete word" button
   And User clicks on "Yes, delete"
 }
end

When /^User enter own translation "(.*?)"$/ do |own_trans|
  @own_trans=own_trans
  fill_in LOCATOR['own_trans_txt_field'],:with=> own_trans
end

When /^User enter second own translation "(.*?)"$/ do |own_trans|
  @second_own_trans=own_trans
  fill_in 'definition_value',:with=> own_trans
  find("input[value='Save']").click
end

Then /^User should not see input box for own translation$/ do
  has_no_css?("input[id='memo_words_builder_stub_definition_value']").should==true
end

Then /^User should see entered translation$/ do
  has_content?(@own_trans).should==true
end

Then /^User should see second own translation "(.*?)"$/ do |own_trans|
  has_content?(own_trans).should==true
end