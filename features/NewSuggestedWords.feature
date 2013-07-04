Feature: As a vocabla user,after getting login,User add new suggested words

Scenario: Add new suggested words and check the word count
Given "English User" logged in
When User clicks New word button
	And User types "dog" and clicks "Add word" button
	And User clicks "Save word" button
	And User adds 15 suggested words
	And User clicks "Lists" from the menu
Then User should see: "You have more than 15 words"
	And User gets total 16 words in the list menu along with "dog"
When User navigates to dashboard
Then number of "16 new words" should be displayed in activity stream
	And "+32 points" should be displayed in activity stream