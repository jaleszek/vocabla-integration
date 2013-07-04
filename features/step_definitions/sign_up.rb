require_relative 'helper/helper_file'
require 'yaml'
include Helper

#load yml
LOCATOR = YAML.load_file("config/locators.yml")
Given(/^User visits "(.*?)"$/) do |page|
  visit ENV_URL
end

Then(/^User is being redirected to "(.*?)"$/) do |page|
  case page.capitalize # Capitalize returns a copy of str with first character converted to uppercase & remainder to lowercase.
  when 'Home page'
    current_url.should == LOCATOR['home_Page_URL']
  when 'Select Language Page'
    current_url.should == LOCATOR['sel_lang_Page_URL']
  end
end

When(/^User clicks? "(.*?)" button$/) do |button|
  case button.capitalize
  when 'Sign up free'
    within(LOCATOR['sign_up_stripe']) do
      click_link 'Sign Up Free'
      sleep 5
    end
  when 'Register'
    click_button 'Register'
    if has_content?('Email has already been taken')==true
     steps %{
       When User fills right "email"
       And User fills right "password"
       When User clicks "Register" button
     }      
    end
  when 'Sign out'
    page.find(LOCATOR['sign_out']).click
    sleep 5
  when 'Save word'
    click_link button
  when 'Login'
    click_link 'Log in'
  when 'Show different words'
    find("a[class='btn btn-app']").click
  end
end

Then(/^User should be on "(.*?)" page$/) do |page|
  case page.capitalize
  when 'Sign up'
    page_url=LOCATOR['sign_up_page']
  when 'Dashboard'
    page_url=LOCATOR['dashBoard_page']
  when 'Login'
    page_url=LOCATOR['login_page']
  end
  current_url.include?(page_url)==true
end

When(/^User fills right "(.*?)"$/) do |field|
  case field
  when 'email'
    email=getEmail
    fill_in 'user[email]',:with => email
  when 'password'
    fill_in 'user[password]',:with => LOCATOR['password']
  end
end

When(/^User chooses "(.*?)"$/) do |language|
  uri = URI.parse(current_url)
  case language
    when 'Spanish'
      lang_id = 3
    when 'Chineese'
      lang_id = 5
    when 'Arabic'
      lang_id = 4
    when 'Polish'
      lang_id = 2
    when 'English'
      lang_id = 1
  end
  if uri.query.include?("exp=C")
    uri.query.gsub!("exp=C", "exp=B")
    visit uri.to_s
  end
  page.find(:xpath, "//li[@data-definitions_language_id='#{lang_id.to_s}']").click
  # following code should select language in third layout of selection form, somehow hidden fields interrupts it
  # unless uri.query.include?("exp=C")
  #   page.find(:xpath, "//li[@data-definitions_language_id='#{lang_id.to_s}']").click
  # else
  #   within '#select_languages' do
  #     page.find(:xpath, "//option[@data-definitions_language_id='#{lang_id.to_s}']").select_option
  #   end
  #   sleep 1
  #   click_link "Start!"
  # end
end



Then(/^User sees "(.*?)" image$/) do |start_here|
  sleep 5
  page.should have_css(LOCATOR['start_here'])
end

When(/^User clicks on Facebook button$/) do
  click_link 'Sign up with Facebook'
  sleep 5
end

Then(/^User is redirected to Facebook$/) do
  current_url.include?LOCATOR['facebook'] == true
  should have_content("Log in to use your Facebook account with Vocabla.")
end

When(/^User sets up all the correct info$/) do
  fill_in 'email', :with => ''
  fill_in 'pass', :with => ''
  find("input[value='Log In']").click
end
