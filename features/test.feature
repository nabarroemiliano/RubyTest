Feature: Product search

Scenario: User search for a product and exists
  Given a user go to www.google.com
  When he search for 'eriks shop nl'
  And select the first option
  And change the language to English
  And search for the product 'loctite'
  Then the product 'Loctite 4601-20 GR' should exist in the results
