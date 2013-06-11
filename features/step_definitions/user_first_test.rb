Given(/^"(.*?)" added a new word$/) do |user|
  steps %{
   Given User visits "login page"
   Then User is being redirected to "HOME PAGE"
   When User clicks "Sign Up Free" button
   Then User should be on "Sign Up" page
   When User fills right "email"
   And User fills right "password"
   When User clicks "Register" button
   Then User is being redirected to "Select Language Page"
   When User chooses "English"
   Then User should be on "Dashboard" page
   When User clicks New word button
   And User types "dog" and clicks "Add word" button
   When User clicks "Save word" button

  }
end

Then(/^the points today should be greater than zero$/) do
  today_points = find(LOCATOR['today_points']).text
  today_points.to_i.should be > 0
end

Then(/^the total points should be greater than zero$/) do
  total_points = find(LOCATOR['total_points']).text
  total_points.to_i.should be > 0
end

Then(/^the Daily rank should contain some number$/) do
  daily_rank = find(LOCATOR['daily_rank']).text
  daily_rank.to_i.should be > 0
end

Then(/^points left and percentage should be greater than zero$/) do
  points_left=find(LOCATOR['points_left']).text
  percent=find(LOCATOR['percent']).text
  percentage=percent.split('%').first
  points_left.to_i.should be > 0
  percentage.to_i.should be > 0
end

Then(/^"(.*?)" should be displayed in Activity Stream$/) do |text|
  within(LOCATOR['activity_stream'])do
  (has_content?text).should == true
  end
end

Then(/^number of points displayed in Activity Stream should be greater than zero$/) do
  points=find(LOCATOR['points']).text
  points=points.split('+').last
  points.to_i.should be > 0
end

When(/^User clicks on "(.*?)" button$/) do |button|
  case button
  when 'Play & learn'
    if has_link?("Play & learn")
      click_link 'Play & learn'
    else
      click_link 'Play & Learn'
    end
  when 'Delete word'
    find(LOCATOR['delete_words']).click
  when 'Do a test'
    find(LOCATOR['do_test']).click
  end
  sleep 3
end

Then(/^User should see "(.*?)"$/) do |msg|
  should have_content(msg)
end

Then(/^User should see "(.*?)" on the left hand side$/) do |txt|
(has_content?txt).should==true
end

Then(/^User should see five possible answers along with "(.*?)"$/) do |correct_ans|
  first(  LOCATOR['first_option'],:text=>'dog').should == nil
  first(  LOCATOR['second_option'],:text=>'dog').should == nil
  first(  LOCATOR['third_option'],:text=>'dog').should == nil
  first(  LOCATOR['fourth_option'],:text=>'dog').should == nil
  if has_xpath?("//div[@id='quiz']/div[1]//div[@class='answers']/ul/li[@class='btn-answer correct']/p[text()='dog']")
    find(  LOCATOR['correct_option'],:text=>correct_ans)
  else
    find(  LOCATOR['correct_option'],:text=>'-- None from above --')
  end
end

When(/^User selects a wrong option$/) do
  find(  LOCATOR['wrong_answer']).click
end

Then(/^User should be redirected to Congrats Screen$/) do
(has_content?'Congrats!').should==true
end

When(/^User clicks "(.*?)"$/) do |link|
  case link
  when 'Next Test'
    find(LOCATOR['next_test']).click
  when 'Finish Test'
    find(LOCATOR['finish_test']).click
  end
  sleep 3
end
Then(/^User is redirected to test screen$/) do
  should have_css(LOCATOR['test_screen_finish'])
end

When(/^User selects "(.*?)" as the answer$/) do |correct_answer|
  find(LOCATOR['correct_answer']).click
end

When(/^User clicks on "(.*?)"$/) do |link|
  click_link link
end

Then(/^User is redirected to "(.*?)" page under "(.*?)" tab$/) do |tab, list_name|
  has_css?(LOCATOR['dashboard']).should==true
  has_content?(list_name).should==true
end

Then(/^User should see memorized percent greater than zero beside Play & learn button$/) do
  mem_percent=find(LOCATOR['percent']).text
  mem_percent=mem_percent.split('%').first
  mem_percent.to_i.should be > 0
end

Then(/^User should see memorized percent greater than zero beside word translation panel$/) do
  mem_percent=find("div[class='progress_box']").text
  mem_percent=mem_percent.split('%').first
  mem_percent.to_i.should be > 0
end

When(/^User navigates to dashboard$/) do
  find("div[id='navigation-column'] * li[class='dashboard-icon-dashboards'] * span").click
end
