Feature: Manage users
  In order to manage users
  An administrator
  wants to add and delete users
  
  Scenario: Register new user
    Given I am on the new user page
    When I fill in "Name" with "name 1"
    And I fill in "Public key" with "public_key 1"
    And I press "Create"
    Then I should see "name 1"
    And I should see "public_key 1"

  Scenario: Delete user
    Given the following users:
      |name|public_key|
      |name 1|public_key 1|
      |name 2|public_key 2|
      |name 3|public_key 3|
      |name 4|public_key 4|
    When I delete the 3rd user
    Then I should see the following users:
      |Name|Public key|
      |name 1|public_key 1|
      |name 2|public_key 2|
      |name 4|public_key 4|
