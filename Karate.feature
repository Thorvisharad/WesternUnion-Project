Feature: create a new booking and perform CRUD operations

  Background: 
    * url 'https://restful-booker.herokuapp.com'
    * def booking =
      """
      
      {
      
      "firstname" : "Jim",
      
      "lastname" : "Brown",
      
      "totalprice" : 111,
      
      "depositpaid" : true,
      
      "bookingdates" : {
      
          "checkin" : "2018-01-01",
      
          "checkout" : "2019-01-01"
      
      },
      
      "additionalneeds" : "Breakfast"
      
      }

      """
    * def update =
      """
      
      {
      
      "firstname" : "James",
      
      "lastname" : "Brown",
      
      "totalprice" : 111,
      
      "depositpaid" : true,
      
      "bookingdates" : {
      
        "checkin" : "2018-01-01",
      
        "checkout" : "2019-01-01"
      
      },
      
      "additionalneeds" : "Breakfast"
      
      }

      """
    * def partialUpdate =
      """
      
      {
      
      "firstname" : "James",
      
      "lastname" : "Brown"
      
      }

      """

  Scenario: create a new booking
    Given path '/booking'
    And header  Content-Type = 'application/json'
    And configure ssl = true
    And request booking
    When method POST
    Then status 201
    And match $.Status == '#present'
    And match $.Status == 'OK'
    And match $ Contains { bookingid:"#notnull"}
    * def id = response.bookingid
    * print id
    * def bookingfirstname = response.firstname

  Scenario: validate a newly created booking
    Given path  '/booking/10'
    And configure ssl = true
    When method GET
    Then status 200
    Then match response.firstname="#notnull"
    And match $.firstname == booking.firstname
    And match $.lastname == booking.lastname
    And match $.totalprice == booking.totalprice

  Scenario: update a booking
    Given path '/booking/'+id
    And header  Content-Type = 'application/json'
    And configure ssl = true
    And request update
    When method PUT
    Then status 200
    Then match response == "#object"
    Then match $.firstname=="James"
    * def id = response.bookingid
    * def bookingfirstname = response.firstname

  Scenario: partial update a booking
    Given path '/booking/'+id
    Given header  Content-Type= 'application/json'
    And configure ssl = true
    And request partialUpdate
    When method PATCH
    Then status 200
    Then match $.firstname == "John"
    Then match $.lastname == "Jonas"
    Then match $.totalprice == 111

  Scenario: Delete a booking
    Given path '/booking/'+id
    And configure ssl = true
    When method DELETE
    Then status 201
    Then match $.Status == 'Created'
    Then match response == '#null'
