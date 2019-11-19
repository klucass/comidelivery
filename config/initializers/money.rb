# config/initializers/money.rb
MoneyRails.configure do |config|

  # set the default currency
  config.default_currency = :brl
  config.no_cents_if_whole = false

end