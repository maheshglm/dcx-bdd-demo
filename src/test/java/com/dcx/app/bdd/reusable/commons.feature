@ignore
Feature: Reusable Scenarios

  Background:
    # This is how we can call Java classes & methods
    * def ThreadUtils = Java.type('com.dcx.app.utils.ThreadUtils')
    * def thread = new ThreadUtils()

  @launch_dcx_app
  Scenario: Launch DCX App
    * print "consuming app_url values for "  + env  + " environment"
    * configure driver = { type: 'chrome', showDriverLog: false }
    * driver app_url
    * def cookies = exists("//span[text()='Accept all cookies']")
    * if(cookies) locate("//span[text()='Accept all cookies']").click()
    #* driver.fullscreen()
    * thread.sleep(2)

  @login_dcx_app
  Scenario: Login into DCX App
    * print "consuming username and password values for "  + env  + " environment"
    * locate('#mat-input-0').input(username)
    * locate('#mat-input-1').input(password)
    * click("//span[contains(text(),'Login to your DCX Account')]")