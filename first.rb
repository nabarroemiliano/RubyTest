require "selenium-webdriver"
require "rest-client"
require "test-unit"
require 'test/unit/assertions'




driver = Selenium::WebDriver.for :chrome
driver.manage.window.maximize
driver.navigate.to "http://google.com"

search = driver.find_element(:name, 'q')
search.send_keys "shop eriks	nl"
search.submit

sleep 5

links = driver.find_elements(:tag_name, "cite")

for link in links

  puts link.text
    if link.text == "https://shop.eriks.nl/nl/"
    link.click
    break
  end

end
sleep 5
coockie = driver.find_element(:id, "CybotCookiebotDialogBodyButtonAccept")
coockie.click

language = driver.find_element(:id, "js-flipout--lang")
language.click

eng = driver.find_element(:xpath, "//li[@id='lang-flipout-li']/div/div/div[2]/a[2]")
eng.click


productSearch = driver.find_element(:id, "searchTerm")
productSearch.send_keys "loctite"
productSearch.submit


pageSize = driver.find_element(:id, "pageSize")
option = Selenium::WebDriver::Support::Select.new(pageSize)
option.select_by(:text, '200')


products = driver.find_elements(:class_name, "product-name")

prodFound = false

for product in products

  if product.text == "High temp retainer 6300 50ml"
    product.click
    prodFound = true
    break

  end

end

assert(prodFound, "Couldn't find the product")
