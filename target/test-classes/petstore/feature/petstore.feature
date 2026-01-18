Feature: PetStore API Tests
    # This feature tests basic CRUD operations of the PetStore API

    Background:

    * url apiUrl
    * def petRequestBody = read('classpath:petstore/json/newPetRequest.json')

    Scenario: Add a new pet to the store
        Given path '/pet'
        And request petRequestBody
        When method post
        Then status 200

        # Validate the response
        And match response contains 
        """
        {
        "id": #(petRequestBody.id),
        "name": '#(petRequestBody.name)',
        "status": '#(petRequestBody.status)'
        }
        """
    Scenario: Retrieve the previously added pet by ID
        Given path '/pet', petRequestBody.id
        When method get
        Then status 200

        # Validate the response fields
        And match response contains 
        """
        {
        "id": #(petRequestBody.id),
        "name": '#(petRequestBody.name)',
        "status": '#(petRequestBody.status)'
        }
        """
    Scenario: Update the pet name and set its status to sold
        Given path '/pet'
        And request { "id": #(petRequestBody.id), "name": "Akira-Vendido", "status": "sold"}
        When method put
        Then status 200

        #Validate that status was updated
        And match response.name == "Akira-Vendido"
        And match response.status == "sold"

    Scenario: Search for pet by sold status
        Given path '/pet/findByStatus'
        And param status = 'sold'
        When method get
        Then status 200

        #Validate that the list contains at least one pet with status "sold"
        And match response[*].status contains 'sold'
        And match response[*].id contains petRequestBody.id
