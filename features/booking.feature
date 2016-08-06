Feature: As an admin
  In order be able to book a resource
  I would like to see current bookings on the dashboard


  Background:
    Given time is frozen at 2016-01-01

    And the following admin account is configured
      | email            | password       |
      | admin@random.com | admin_password |

    And the following resources exist
      | designation | description       |
      | Galaxy      | The Galaxy room   |
      | Atlantis    | The Atlantis room |

    And the following bookings exist
      | resource | client | date       | start_time | end_time |
      | Galaxy   | Thomas | 2016-01-02 | 10:30      | 11:30    |
      | Galaxy   | Raoul  | 2016-01-02 | 13:30      | 14:30    |
      | Atlantis | Raoul  | 2016-01-02 | 14:00      | 14:30    |
      | Atlantis | Volvo  | 2016-01-02 | 08:00      | 09:30    |
      | Atlantis | Thomas | 2016-01-02 | 17:00      | 18:30    |


  Scenario: Displaying bookings
    Given time is frozen at 2016-01-02
    And I am using the dashboard
    Then there should be "2" current bookings for "Galaxy"
    And I should see bookings for "Galaxy"
    Then there should be "3" current bookings for "Atlantis"
    And I should see bookings for "Atlantis"

  Scenario: Displaying booking details
    Given time is frozen at 2016-01-02
    And I am using the dashboard
    Then I should see the following content in resource box
      | content                                | resource |
      | Grupp: Thomas Start: 10:30 Slut: 11:30 | Galaxy   |
      | Grupp: Raoul Start: 13:30 Slut: 14:30  | Galaxy   |
      | Grupp: Raoul Start: 14:00 Slut: 14:30  | Atlantis |
      | Grupp: Volvo Start: 08:00 Slut: 09:30  | Atlantis |
      | Grupp: Thomas Start: 17:00 Slut: 18:30 | Atlantis |
