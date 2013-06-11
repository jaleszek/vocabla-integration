Feature: As a vocabla user,after getting login,User should be able to give test

Scenario: Addition of new word and give the test 
Given "English User" added a new word
When User navigates to dashboard
Then the points today should be greater than zero
	And the total points should be greater than zero
	And the Daily rank should contain some number
	And points left and percentage should be greater than zero
	And "1 new word" should be displayed in Activity Stream
	And "You added words: dog" should be displayed in Activity Stream
	And number of points displayed in Activity Stream should be greater than zero
When User clicks on "Play & learn" button
Then User should see "You have only 1 word."
When User clicks on "Do a test" button
	And User should see "a member of the genus Canis" on the left hand side
	And User should see five possible answers along with "dog"
When User selects a wrong option
Then User should be redirected to Congrats Screen
When User clicks "Next Test"
Then User is redirected to test screen
When User selects "dog" as the answer
When User clicks "Finish Test"
Then User is redirected to "Main List" page under "List" tab
	And User should see memorized percent greater than zero beside Play & learn button
	And User should see memorized percent greater than zero beside word translation panel
When User navigates to dashboard
Then the points today should be greater than zero
	And the total points should be greater than zero
	And the Daily rank should contain some number

