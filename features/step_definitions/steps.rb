require "selenium-webdriver"
require "rest-client"
require "test-unit"
require 'test/unit/assertions'
require 'capybara/cucumber'
require './pageObjects/Google.rb'
require './pageObjects/HomePage.rb'


google = GoogleSearch.new
homePage = HomePage.new

  Given /^a user go to www.google.com$/ do
    google.load

  end

  When("he search for {string}") do |string|
    google.search_term(string)

  end

  When("select the first option") do
    google.select_page
  end

  When("change the language to English") do

    homePage.acceptCookies
    homePage.select_language

  end

  When("search for the product {string}") do |string|
    homePage.search_term(string)
  end

  Then("the product {string} should exist in the results") do |string|

      page.select '200', from: 'pageSize'
      homePage.select_stock
      homePage.select_product(string)

      expect(page).to have_content("Loctite 4601-20 GR")

  end
