require 'capybara/cucumber'
require 'site_prism'

class GoogleSearch < SitePrism::Page

  set_url 'http://google.com'

  element :search,  '[name= "q"]'
  elements :links, "[href='https://shop.eriks.nl/nl/']"

  def search_term(string)
    search.set string
    search.native.send_keys(:return)
  end


  def select_page

    for link in links
      link.click
    end

  end
end
