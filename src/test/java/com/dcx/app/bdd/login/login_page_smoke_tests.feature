@smoke @login
Feature: DCX App Login page tests

  Background:
    #* call read('../reusable/launch_dcx_app.feature')
    * call read('../reusable/commons.feature@launch_dcx_app')

  Scenario: Checking login page elements
    #* call read('../reusable/commons.feature@login_dcx_app')
    * locate('#mat-input-0').input('test@gmail.com')
    * locate('#mat-input-1').input('qwerty')
    * click("//span[contains(text(),'Login to your DCX Account')]")
    * thread.sleep(2)
    * screenshot()