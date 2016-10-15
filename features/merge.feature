Feature: Article Merge
  As an admin
  In order to consolidate information from same author
  I want to merge articles

  Scenario: Admin should see feature in the edit view
    Given the blog is set up
    And I am logged into the admin panel
    When I follow "All Articles"
    And I follow "Edit"
    Then I should see "Merge Articles"
    
  Scenario: When articles are merged, the merged article should contain the text of both previous articles
    Given the blog is set up
    And I am logged into the admin panel
    Given I am on the new article page
    When I fill in "article_title" with "Foobar"
    And I fill in "article__body_and_extended_editor" with "Lorem Ipsum"
    And I press "Publish"
    Then I should be on the admin content page
    
    Given I am on the new article page
    When I fill in "article_title" with "Foobar1"
    And I fill in "article__body_and_extended_editor" with "test"
    And I press "Publish"
    Then I should be on the admin content page
    
    When I follow "Edit"
    And I fill in "Article ID" with "1"
    And I press "Merge"
    Then I should be on the admin content page
    Then I should not see "Hello World"

  Scenario: A non-admin cannot merge two articles
    Given the user blog is set up
    And I am logged into the user panel
    When I follow "All Articles"
    And I follow "Edit"
    Then I should not see "Merge Articles"