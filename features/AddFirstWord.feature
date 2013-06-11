Feature: As a vocabla user,after getting login,I want to add a new word in the list and verfiy the translation

Scenario: Spanish User adds first word
Given "Spanish" User visits "login page"
Then User is being redirected to "HOME PAGE"
When User clicks "Login" button
Then User should be on "Login" page
When "Spanish" User fills right "email"
	And "Spanish" User fills right "password"
When User clicks "Login button" to Login
Then User should be on "Dashboard" page
When User clicks New word button
	And User types "dog" and clicks "+ Add word" button
Then User gets number of people who added this word
	And User gets "perro" translation
	And User gets: Main list as target list
When User clicks "Save word" button
Then User is redirected to the same page, but with yellow successful message
When User clicks "Lists" from the menu
Then User gets "dog" "perro" pair on the list
When User click "Sign out" button
Then User is being redirected to "HOME PAGE"

Scenario: English User adds first word
Given "English" User visits "login page"
Then User is being redirected to "HOME PAGE"
When User clicks "Login" button
Then User should be on "Login" page
When "English" User fills right "email"
	And "English" User fills right "password"
When User clicks "Login button" to Login
Then User should be on "Dashboard" page
When User clicks New word button
	And User types "dog" and clicks "Add word" button
Then User gets number of people who added this word
	And User gets "go after with the intent to catch" translation
	And User gets: Main list as target list
When User clicks "Save word" button
Then User is redirected to the same page, but with yellow successful message
When User clicks "Lists" from the menu
Then User gets "dog" "perro" pair on the list
When User click "Sign out" button
Then User is being redirected to "HOME PAGE"