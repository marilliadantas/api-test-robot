*** Settings ***
Resource                          ../resources/config/services.robot
Suite Setup                       Connect api   /login

*** Test Cases ***
CT01: List users         
    Send the GET request          /users
    Validate the contract         ${SCHEMA_USERS} 
    Validate statusCode           200  

CT02: List user by ID
    Create Users                  Test                Automation         testautomation10@test.com
    Send the POST request         /users              ${USERS_BODY}  
    Send the GET request by ID    /users              ${id}
    Validate statusCode           200
    Validate values users         Test                Automation         testautomation10@test.com
    Send the DELETE request       /users              ${id}

CT03: List user by ID
    Send the GET request by ID    /users              600
    Validate statusCode           404
    Validate message              User not found

CT04: Create Users
    Fakers
    Create Users                  ${FakeFirstname}    ${FakeLastname}    ${FakeEmail}
    Send the POST request         /users              ${USERS_BODY}        
    Validate statusCode           201
    Send the DELETE request       /users              ${id}

CT05: Update Users
    Create Users                  Test                Automation         testautomation10@test.com
    Send the POST request         /users              ${USERS_BODY}
    Create Users                  Nattan              Test               nattantest@gmail.com
    Send the PUT request          /users              ${USERS_BODY}   
    Validate statusCode           200
    Validate values users         Nattan              Test               nattantest@gmail.com
    Send the DELETE request       /users              ${id}

CT06: Delete Users
    Fakers
    Create Users                  ${FakeFirstname}    ${FakeLastname}    ${FakeEmail}
    Send the POST request         /users              ${USERS_BODY}
    Send the DELETE request       /users              ${id}
    Validate statusCode           200
    Validate message              User id ${id} deleted.

CT07: Delete Users Not Found
    Send the DELETE request       /users              500
    Validate statusCode           404
    Validate message              User not found