Feature: karate example

  # *url 'https://reqres.in/api/users/'
  Scenario: create and retrieve a user name
    Given url 'https://reqres.in/api/users/'
    And header Content-Type = 'application/json'
    And configure ssl = true
    And request
      """
      
      
      
      
      
      
      
      {
      
      
      
          "name": "harshada",
      
      
      
          "job": "testernew"
      
      
      
      }
      
      
      
      
      
      

      """
    When method POST
    Then status 201
    And match response == { id :'#notnull', name:'harshada',job:'testernew',createdAt:'#notnull'}
    Given path response.id
    And print response

  #Then status 200
  Scenario: get and retrieve a user name
    Given url 'https://reqres.in/api/users/'
    And header Content-Type = 'application/json'
    And configure ssl = true
    And request
      """
      
      
      
      
      
      
      
      {
      
      
      
          "name": "George",
      
      
      
          "job": "Bluth"
      
      
      
      }
      
      
      
      
      
      

      """
    When method GET
    Then status 200
    # And match response contains { id :1, name:'George',job:'Bluth',createdAt:'#notnull'}
    Given path response.id
    And print response

  #Then status 200
  Scenario: put and retrieve a user name
    Given url 'https://reqres.in/api/users/'
    And header Content-Type = 'application/json'
    And configure ssl = true
    And request
      """
      
      
      
      
      
      
      
      {
      
      
      
          "name": "George",
      
      
      
          "job": "Bluth"
      
      
      
      }
      
      
      
      
      
      

      """
    When method PUT
    Then status 200
    # And match response contains { id :1, name:'George',job:'Bluth',createdAt:'#notnull'}
    Given path response.id
    And print response

  Scenario: Patch and retrieve a user name
    Given url 'https://reqres.in/api/users/'
    And header Content-Type = 'application/json'
    And configure ssl = true
    And request
      """
      
      
      
      
      
      
      
      {
      
      
      
          "name": "George",
      
      
      
          "job": "Bluth"
      
      
      
      }
      
      
      
      
      
      

      """
    When method PATCH
    Then status 200
    # And match response contains { id :1, name:'George',job:'Bluth',createdAt:'#notnull'}
    Given path response.id
    And print response

  Scenario: Delete and retrieve a user name
    Given url 'https://reqres.in/api/users/'
    And header Content-Type = 'application/json'
    And configure ssl = true
    And request
      """
      
      
      
      
      
      
      
      {
      
      
      
          "name": "George",
      
      
      
          "job": "Bluth"
      
      
      
      }
      
      
      
      
      
      

      """
    When method Delete
    Then status 204
    # And match response contains { id :1, name:'George',job:'Bluth',createdAt:'#notnull'}
    Given path response.id
    And print response
