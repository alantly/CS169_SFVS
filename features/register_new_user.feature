Feature: fill a registeration form to make a new account
 
  As a new user
  So that I can make a new account
  I want to be able to fill a registeration form.

Background: On the registeration page
  
  Given I am on the "registration" page

Scenario: fill out the form
  When I fill in "user_email" with "JohnTest@gmail.com"
  And I fill in "user_password" with "bear12345"
  And I fill in "user_password_confirmation" with "bear12345"
  And I press "Sign up"
  Then I should be on the "profile" page for "JohnTest@gmail.com"

Scenario: applying for a username that is already taken
  Given the following users exist: 
  | username          | password         | company          | status         |
  | John              | bear             | Whole Foods      | Sponsor        |

  When I fill the "username" box with "John"
  And I fill the "password" box with "bare"
  And I fill the "company" box with "Taco Bell"
  When I click "continue"
  Then I should see "username taken"
  And the "username" box should have "John"
  And the "company" box should have "Taco Bell"

Scenario: any empty boxes returns an error
  When I fill the "username" box with "John"
  And I fill the "password" box with "bare"
  And I fill the "company" box with ""
  When I click "continue"
  Then I should see "company box is empty"
