Given(/^"(.*?)" logged in$/) do |user|
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
  }
end

When(/^User adds (\d+) suggested words$/) do |n_words|
  within(".mcarousel") do
    n_words.to_i.times do
      click_link "+ Add word"
      sleep 3
    end
  end
end

Then(/^User gets total (\d+) words in the list menu along with "(.*?)"$/) do |word_count, word|
  sleep 5
  get_count=all("div[id='memo_words']>div[class='memo_word tr']").count
  (get_count.to_s).should==word_count.to_s
  has_content?(word).should==true
end

When(/^number of "(.*?)" should be displayed in activity stream$/) do |txt|
  has_content?(txt).should==true
end

When(/^"(.*?)" should be displayed in activity stream$/) do |points|
  has_content?(points).should==true
end

When(/^User should see: "(.*?)"$/) do |info|
  sleep 2
  has_content?(info).should==true
end