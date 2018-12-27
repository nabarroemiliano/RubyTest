require 'capybara/cucumber'
require 'site_prism'


class HomePage < SitePrism::Page
element :cookie,  '[id= "CybotCookiebotDialogBodyButtonAccept"]'
element :languageButton,  '[id= "js-flipout--lang"]'
element :language,  '[href="https://shop.eriks.nl/en/"]'
element :search, '[name="searchTerm"]'
elements :products, '.product-name'
element :stock, '[id= "facetList-2"]'


def acceptCookies
  cookie.click
end

def select_language
  languageButton.click
  language.click
end


  def search_term(string)
    search.set string
    search.native.send_keys(:return)
  end

  def select_stock
    stock.click
  end

  def select_product(string)

    for product in products
        if product.text == string
        product.click
        break
        end
    end
  end

end
