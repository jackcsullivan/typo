Feature: Article Merge
  As an admin
  In order to consolidate information from same author
  I want to merge articles
  
  Background:
    Given the blog is set up
    And I am logged into the admin panel
    And I create new article "Test1" with: text "test1", author "Jack", comments "Test article"
    And I create new article "Test2" with: text "test2", author "Tommy", comments "Test article, the sequel"

  Scenario: Admin should see feature in the edit view
    Given the blog is set up
    And I am logged into the admin panel
    When I follow "All Articles"
    And I follow "Edit"
    Then I should see "Merge Articles"
    
  Scenario: Admin merging articles (happy path)
    Given the blog is set up
    And I am logged into the admin panel
    And I am on the edit page for article "Test1"
    Then I fill "merge_with" with "2"
    And I click_button "Merge"
    Then I should see "Test article" and "Test article, the sequel" in "Test1"

  Scenario: Non admin attempts to merge articles (sad path)
    Given the blog is set up
    When I follow "All Articles"
    And I follow "Edit"
    Then I should see "Merge Articles"