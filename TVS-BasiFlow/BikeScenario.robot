*** Settings ***

Library           SeleniumLibrary

    
*** Variables ***
${browser}    chrome
${url_1}    http://45.63.86.127/


*** Keywords ***

Jenkins browser launch
    [Arguments]    ${url}
    Set Selenium Speed    1s
    ${chrome_options} =    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    headless
    Call Method    ${chrome_options}    add_argument    disable-gpu
    Call Method    ${chrome_options}    add_argument    no-sandbox
    Create WebDriver    Chrome    chrome_options=${chrome_options}
    Set Window Size    1920    1080
    Go To    ${url}
    #Maximize Browser Window
    Set Browser Implicit Wait    60s

Local browser launch landingpage
    [Arguments]    ${baseurl}    ${browser}
    Set Selenium Speed    .5s
    Open Browser    ${baseurl}    ${browser}
    Maximize Browser Window
    Set Browser Implicit Wait    30s  
    
Select Bike
      Click Element    //ul[@class='nav nav-tabs']/li[2] 
Enter Registration  
     [Arguments]   ${Reg}
     Input Text    //input[@id='edit-bikereg-no']    ${Reg}  
       
Click Get Quote 
   Click Element    //input[@class='regSubmitInputBike button js-form-submit form-submit']

Clear Registration Number
    Clear Element Text    //input[@id='edit-bikereg-no']  
    
Select Your Car
    Click Element    //ul[@class='popular-cars popular-cars-bikes']/li[5] 
    
Select your Model
    Click Element    (//div[@class='col-md-3 col-xs-4 col-sm-4'])[4] 
    
Select your Fuel Type
    Click Element    //div[@class='row selectyourfueltype']/div[1]  
    
Select your varient
    Click Element    //div[@class='row selectyourvariant']/div[1] 
    
Selecy year of registration
    Click Element    (//div[@class='row selectyearofregistration'])/div[1]     
    
Select Not Expired
    Click Element    (//label[@class='option'])[1]   
    
Click Next button
   Click Element    //input[@class='button js-form-submit form-submit btn-next'] 
   
FirstName  
     [Arguments]   ${Fname}
     Input Text    //input[@name="first_name"]    ${Fname}   
LastName      
    [Arguments]   ${Lname}
     Input Text    //input[@name="last_name"]      ${Lname}   
Email
    [Arguments]   ${Email}
     Input Text    //input[@name="email"]   ${Email}   
Phone no    
    [Arguments]   ${Phone}
     Input Text    //input[@name="mobile_no"]    ${Phone}
     
Submit Get Quote
    Click Element   (//input[@class='button js-form-submit form-submit'])[2]   
 
Select Expired 
    Click Element    (//label[@class='option'])[2]   
    
Select CPA
     Click Element    //label[text()='CPA']  
     
Click BreakUp
    Click Element    //span[@class='breakup-item']  


* Test Cases *
TVS Test Case Bike basic Flow 
       
         
        # Jenkins browser launch    ${url}
    Local browser launch landingpage    ${url_1}    ${browser}     
    
        

   Select Bike       
   Enter Registration       TN-bb-BK-BBB  
   sleep    5  
   Click Get Quote
   ${Registration}=    Get Text    xpath=//strong[text()='Please Enter Valid Registration Number']
   Log To Console    ${Registration}
       
   ${Reg}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@class='form-item--error-message homeerror']
   Run Keyword If    'True'!='${Reg}'    Fail    "Enter Invalid Registration then click Get Quote button, 'Please Enter Valid Registration Number' alert message not display" 
        
    Clear Registration Number     
    Enter Registration      TN-12-BK-4233     
    Click Get Quote    
    
    Select Your Car
    sleep    5    
    Select your Model
    sleep    5       
    Select your Fuel Type  
    sleep    5  
    Select your varient     
    sleep    5      
    Selecy year of registration   
    sleep    5  
    Select Not Expired    

        # Select the Date
   Click Element    //div[@id='ui-datepicker-div']   
   Select From List By Value    //select[@class='ui-datepicker-year']    2021
   Click Link    xpath=(//a[@href='#'])[3]
      
   Click Next button     
   FirstName    Test
   LastName    Tester
   Email    test@gmail.com
   Phone no    9940613576  
   Submit Get Quote
   
   Close Browser
   

   
* Test Cases *
TVS Test Case Bike Select Company
       
         
        # Jenkins browser launch    ${url}
    Local browser launch landingpage    ${url_1}    ${browser}     
    
        

    Select Bike         
    Enter Registration      TN-12-BK-4233     
    Click Get Quote    
    
    Select Your Car
    sleep    5    
    Select your Model
    sleep    5       
    Select your Fuel Type  
    sleep    5  
    Select your varient     
    sleep    5      
    Selecy year of registration   
    sleep    5  
    Select Not Expired    

        # Select the Date
   Click Element    //div[@id='ui-datepicker-div']   
   Select From List By Value    //select[@class='ui-datepicker-year']    2021
   Click Link    xpath=(//a[@href='#'])[3]
      
   Click Next button     
   FirstName    Test
   LastName    Tester
   Email    test@gmail.com
   Phone no    9940613576  
   Submit Get Quote
   
   Sleep    40s    
   # Click Element    xpath=(//select[contains(@class,'mdb-select md-form vehicle-form-select')])[1]
   Click Element    xpath=(//select[contains(@class,'mdb-select md-form vehicle-form-select')])[1]//option[2]      
   
   ${Company}=    Run Keyword And Return Status    Element Should Be Visible    xpath=(//select[contains(@class,'mdb-select md-form vehicle-form-select')])[11]//option[2]   
   Run Keyword If    'True'!='${Company}'    Fail    "Click above Drop Down , 'Select the Company' Company not selected" 
   Close Browser
   

* Test Cases *
TVS Test Case Bike CPA
       
         
        # Jenkins browser launch    ${url}
    Local browser launch landingpage    ${url_1}    ${browser}         
        

    Select Bike       
    Enter Registration      TN-12-BK-4233     
    Click Get Quote    
    
    Select Your Car
    sleep    5    
    Select your Model
    sleep    5       
    Select your Fuel Type  
    sleep    5  
    Select your varient     
    sleep    5      
    Selecy year of registration   
    sleep    5  
    Select Not Expired    

        # Select the Date
   Click Element    //div[@id='ui-datepicker-div']   
   Select From List By Value    //select[@class='ui-datepicker-year']    2021
   Click Link    xpath=(//a[@href='#'])[3]
      
   Click Next button     
   FirstName    Test
   LastName    Tester
   Email    test@gmail.com
   Phone no    9940613576  
   Submit Get Quote
   
   Sleep    50s    
   Select CPA
   Sleep    40s 
   Click BreakUp
   
   ${CPA}=  Get Text    //p[text()='CPA Cover Premium']
   Log To Console    ${CPA} 
   
   ${CPA}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//p[text()='CPA Cover Premium']   
   Run Keyword If    'True'!='${CPA}'    Fail    "Click BreakUp, 'After open the CPS PopUp ' CPA Cover Premium not captured" 
   Close Browser

    
* Test Cases *
TVS Test Case Bike Expired
       
         
        # Jenkins browser launch    ${url}
    Local browser launch landingpage    ${url_1}    ${browser}     
    
        

    Select Bike           
    Clear Registration Number     
    Enter Registration      TN-12-BK-4233     
    Click Get Quote    
    
    Select Your Car
    sleep    5    
    Select your Model
    sleep    5       
    Select your Fuel Type  
    sleep    5  
    Select your varient     
    sleep    5      
    Selecy year of registration   
    sleep    5  
    Select Expired    

        # Select the Date
   Click Element    //div[@id='ui-datepicker-div']   
   Select From List By Value    //select[@class='ui-datepicker-year']    2021      
   Click Element    (//a[@href='#'])[3]  
   
   Click Next button     
   FirstName    Test
   LastName    Tester
   Email    test@gmail.com
   Phone no    9940613576  
   Submit Get Quote
   
   # Close Browser
    

   
   

    
   
    
    
        
    
