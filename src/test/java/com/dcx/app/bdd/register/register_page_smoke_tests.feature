@smoke @register
Feature: DCX App register screen tests

  Background:
    Given call read('../reusable/commons.feature@launch_dcx_app')

  Scenario: Checking register screen elements
    When locate("//strong[contains(text(),'Register')]").click()
    * thread.sleep(2)

    Then assert exists("//strong[contains(text(),'Your First Name')]")
    And assert exists('#mat-input-2')

    And assert exists("//strong[contains(text(),'Your Last Name')]")
    And assert exists('#mat-input-3')

    And assert exists("//strong[contains(text(),'Your Country')]")
    And assert exists('#mat-select-value-1')

    And assert exists("//strong[contains(text(),'Your Job Title')]")
    And assert exists('#mat-select-2')

    And assert exists("//strong[contains(text(),'Your Mobile Number')]")
    And assert exists('#mat-select-value-5')
    And assert exists('#mat-input-6')

    And assert exists("//strong[contains(text(),'Your Work Email')]")
    And assert exists('#mat-input-4')

    And assert exists("//strong[contains(text(),'Choose Password')]")
    And assert exists("//mat-icon[contains(text(),'info_outline')]")
    And assert exists('#mat-input-5')

    And assert exists("//span[text()='BACK'][@class='mat-button-wrapper']")
    #we can add assertions to check whether button is disabled or enabled
    And assert exists("//span[text()='NEXT'][@class='mat-button-wrapper']")
    And assert exists("//span[text()='Clear form'][@class='mat-button-wrapper']")

  Scenario: Register mandatory Field validations
    When locate("//strong[contains(text(),'Register')]").click()
    * thread.sleep(2)

    #Bruteforce way of switching to next field without inputting main field
    #but we can go with better alternatives like Keyboard.TAB

    When click('#mat-input-2')
    And click('#mat-input-3')
    * thread.sleep(1)
    And assert exists("//mat-error[contains(text(),'Your First Name is required')]")

    When click('#mat-input-3')
    And click('#mat-input-2')
    * thread.sleep(1)
    And assert exists("//mat-error[contains(text(),'Your Last Name is required')]")

  Scenario: Password validations
    When locate("//strong[contains(text(),'Register')]").click()
    * thread.sleep(2)

    * locate('#mat-input-5').focus()
    When click('#mat-input-5')
    And assert exists("//span[contains(text(),'Be a minimum of 8 characters')]")
    And assert exists("//span[contains(text(),'Include at least one uppercase letter (A-Z)')]")

    #Its a spelling mistake in the app Include -> Inlcude
    And assert exists("//span[contains(text(),'Inlcude at least one lowercase letter (a-z)')]")
    And assert exists("//span[contains(text(),'Include at least one number (0-9)')]")
    And assert exists("//span[contains(text(),'Include at least one special character')]")

  # Added some hardcoded sleeps for demonstration purpose, but should be removed
  Scenario: Registration of Interest
    * def random = function(){ return java.lang.System.currentTimeMillis() }

    When locate("//strong[contains(text(),'Register')]").click()
    * thread.sleep(2)

    When locate('#mat-input-2').input('Mahesh')
    And locate('#mat-input-3').input('G')

    And locate('#mat-select-value-1').click()
    * thread.sleep(1)

    #And locate(".mat-select-search-inner > .mat-select-search-input").input('Singapore ' + Key.ENTER)

#    This can be correct way to select a country, but somehow its clearing the field after selection
#    So, to move on, I am gng with a brute force option i.e. selecting the 2nd country in the list
#    we need to analyse why this field is not selecting and come up with custom approach

    And locate(".mat-select-search-inner > .mat-select-search-input").input(Key.DOWN + Key.ENTER)
    * thread.sleep(1)

    And locate('#mat-select-2').click()
    * thread.sleep(1)
    And locate(".mat-select-search-inner > .mat-select-search-input").input('CEO' + Key.ENTER)

    And locate('#mat-input-6').input('+914023158661')

    And locate('#mat-input-4').input("mahesh" + random() + "@gmail.com")
    * thread.sleep(1)

    And locate('#mat-input-5').input('Qwerty@123')
    * thread.sleep(1)

    And locate("//span[text()='NEXT'][@class='mat-button-wrapper']").click()
    * thread.sleep(2)

    * thread.debug()

    And locate('#mat-input-7').input('Test Company')
    * thread.sleep(1)

    And locate('#mat-select-value-7').click()
    * thread.sleep(1)
    And locate(".mat-select-search-inner > .mat-select-search-input").input('Insurance' + Key.ENTER)

    And locate('#mat-select-value-9').click()
    * thread.sleep(1)
    And locate(".mat-select-search-inner > .mat-select-search-input").input('Cargo Inspection' + Key.ENTER + Key.ESCAPE)

    And locate('#mat-select-value-11').click()
    * thread.sleep(1)
    And locate(".mat-select-search-inner > .mat-select-search-input").input('Coffee' + Key.ENTER + Key.ESCAPE)

    * thread.debug()

    And locate('#mat-input-9').input('20')
    * thread.sleep(2)

    And locate('#mat-radio-3').click()
    * thread.sleep(2)

    * thread.debug()

    And locate("//span[text()='NEXT'][@class='mat-button-wrapper']").click()
    * thread.sleep(2)

    * def result = exists("//strong[contains(text(),'Thank you for registering your interest in joining')]")

    * if (!result) karate.fail('Registration is not successful')