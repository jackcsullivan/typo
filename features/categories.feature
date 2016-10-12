Feature: Add and Edit Blogging Categories
  As an admin
  In order to categorize my blogged thoughts
  I want to be able to create and edit blog categories
  
  Background:
    Given the blog is set up
    And I am logged into the admin panel
  
  Scenario: 
    When I follow "Categories"
    Then I should see "Categories"