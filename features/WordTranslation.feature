Feature: As a vocabla user,after getting login,User should be able to provide his own translations

Scenario: User operations with words translation
Given "English User" logged in
When User clicks New word button
	And User types "dog" and clicks "Add word" button
When User clicks on "Change translation"
	And User selects "second" translation
When User clicks on "Save word"
	And User clicks "Lists" from the menu
Then User should see "second" translation
When User clicks on "Play & learn" button
Then User should see "second" translation
	And User close the test
When User clicks on change translation image
	And User selects "third" translation
Then User should see "third" translation
When User clicks on "Play & learn" button
Then User should see "third" translation
	And User close the test
When User delete all the words
Then User should see Start here tip
When User clicks New word button
	And User types "cat" and clicks "Add word" button
When User clicks on "Change translation"
	And User enter own translation "small animal with fur"
	And User clicks on "Save translation"
	And User should see entered translation
When User clicks on "Save word"
	And User clicks "Lists" from the menu
	And User should see entered translation
When User clicks on "Play & learn" button
	And User should see entered translation
	And User close the test
When User clicks on change translation image
	And User enter second own translation "animal with nice eyes"
Then User should see second own translation "animal with nice eyes"
When User clicks on "Play & learn" button
Then User should see second own translation "animal with nice eyes"
	And User close the test
When User delete all the words
Then User should see Start here tip