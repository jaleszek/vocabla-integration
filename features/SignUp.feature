Feature: As a vocabla user I want to verify the signup feature with different languages via email and via facebook
Background:
Given User visits "login page"
Then User is being redirected to "HOME PAGE"
When User clicks "Sign Up Free" button
Then User should be on "Sign Up" page

Scenario:Spanish user signs up via e-mail
When User fills right "email"
	And User fills right "password"
When User clicks "Register" button
Then User is being redirected to "Select Language Page"
When User chooses "Spanish"
Then User should be on "Dashboard" page
	And User sees "Start here" image
When User click "Sign out" button
Then User is being redirected to "HOME PAGE"

@wip
Scenario: Spanish user signs up via Facebook
When User clicks on Facebook button
Then User is redirected to Facebook
When User sets up all the correct info
Then User is being redirected to "Select Language Page"
When User chooses "Spanish"
Then User should be on "Dashboard" page
	And User sees "Start here" image
When User click "Sign out" button
Then User is being redirected to "HOME PAGE"


Scenario: Polish user signs up via e-mail
When User fills right "email"
	And User fills right "password"
When User clicks "Register" button
Then User is being redirected to "Select Language Page"
When User chooses "Polish"
Then User should be on "Dashboard" page
	And User sees "Start here" image
When User click "Sign out" button
Then User is being redirected to "HOME PAGE"

@wip
Scenario: Polish user signs up via Facebook
When User clicks on Facebook button
Then User is redirected to Facebook
When User sets up all the correct info
Then User is being redirected to "Select Language Page"
When User chooses "Polish"
Then User should be on "Dashboard" page
	And User sees "Start here" image
When User click "Sign out" button
Then User is being redirected to "HOME PAGE"


Scenario: English user signs up via e-mail
When User fills right "email"
	And User fills right "password"
When User clicks "Register" button
Then User is being redirected to "Select Language Page"
When User chooses "English"
Then User should be on "Dashboard" page
	And User sees "Start here" image
When User click "Sign out" button
Then User is being redirected to "HOME PAGE"

@wip
Scenario: English user signs up via Facebook
When User clicks on Facebook button
Then User is redirected to Facebook
When User sets up all the correct info
Then User is being redirected to "Select Language Page"
When User chooses "English"
Then User should be on "Dashboard" page
	And User sees "Start here" image
When User click "Sign out" button
Then User is being redirected to "HOME PAGE"

