Feature: Search Feature

Scenario: Search Scenario
  Given the app has launched
  And I search for "cats"
  Then I should see images of cats