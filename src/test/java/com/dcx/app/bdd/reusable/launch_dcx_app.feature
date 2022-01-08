@ignore
Feature: Init WebDriver

  Background:
    * def ThreadUtils = Java.type('com.dcx.app.utils.ThreadUtils')
    * def thread = new ThreadUtils()

  Scenario:
    * configure driver = { type: 'chrome', showDriverLog: false }
    * driver fullscreen()
    * driver app_url
    * thread.sleep(2)