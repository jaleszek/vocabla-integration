Feature: As a vocabla user,after getting login,User add new suggested words

Scenario: Add new suggested words and check the word count
Given "English User" logged in
When User clicks New word button
	And User types "dog" and clicks "Add word" button
	And User clicks "Save word" button
	And User clicks on all five suggested words
	And User clicks "Show different words" button
	And User clicks on all five suggested words
	And User clicks "Lists" from the menu
Then User gets total 11 words in the list menu along with "dog"
When User navigates to dashboard
Then number of "11 new words" should be displayed in activity stream
	And "+22 points" should be displayed in activity stream