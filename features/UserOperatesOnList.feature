Feature: As a vocabla user,after getting login,User add new suggested words

Scenario: Creation of list and adding words to it
Given "English User" added a new word
When User clicks "Lists" from the menu
Then User should see "to better organize your words"
When User clicks on "+ Create new list"
Then user should see the url "http://www.vocabla.com/word_lists/new"
	And User should see "Name your new list" in the placeholder
When User create "mylist" as a new list
Then User should see "mylist was created"
	And words on "mylist" list in the Your lists menu should be zero
	And User should see "You don't have any words on this list yet"
	And User should not see "How to use lists?"
When User clicks on "Add new words"
	And User add new word in the list
When User clicks "Lists" from the menu
	And User selects word from Main list
	And User clicks on "Move to list"
	And User select "mylist" as destination
	And User should see the moved words in the list
When User clicks on "Select all"
	And User clicks on "Delete word" button
	And User clicks on "Yes, delete"
Then User should see Start here tip
When User clicks New word button
	And User types "dog" and clicks "Add word" button
When User clicks "Save word" button 
	And User creates a list
When User clicks on "Delete list"
	And User clicks on "Yes, kill the list"
Then User should be on Main List
	#And User should see "How to use lists?"
	And User should not see "myList"