Feature: Log into the application
  In order to access restricted parts of the application
  As a visitor
  I need to log into the application

  Background:
    Given there are the following users:
      | email       | password | enabled |
      | bar@foo.com | foo      | yes     |

  Scenario: Log in with username and password
    Given I am on the store homepage
    And I follow "Login"
    When I fill in the following:
      | Email    | bar@foo.com |
      | Password | foo         |
    And I press "Login"
    Then I should be on the store homepage
    And I should see "Logout"

  Scenario: Log in with bad credentials
    Given I am on the store homepage
    And I follow "Login"
    When I fill in the following:
      | Email    | bar@foo.com |
      | Password | bar         |
    And I press "Login"
    Then I should be on login page
    And I should see "Bad credentials"

  Scenario: Trying to login without credentials
    Given I am on the store homepage
    And I follow "Login"
    When I press "Login"
    Then I should be on login page
    And I should see "Bad credentials"

  Scenario: Trying to login as non existing user
    Given I am on the store homepage
    And I follow "Login"
    When I fill in the following:
      | Email    | john |
      | Password | bar  |
    And I press "Login"
    Then I should be on login page
    And I should see "Bad credentials"