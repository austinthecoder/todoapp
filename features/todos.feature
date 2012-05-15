Feature: To-do Management

Background:
  Given I am on the site

Scenario: Adding a to-do
  When I add a to-do
  Then I should see that to-do in the to-do list