# Paypal Express Checkout
[![Build Status](https://travis-ci.org/chukitow/paypal-express-checkout.svg?branch=master)](https://travis-ci.org/chukitow/paypal-express-checkout)

Simple handler for PayPal Express Checkout

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'paypal_express_checkout'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install paypal_express_checkout

## Usage

```ruby
PaypalExpressCheckout.sanbox! # enables sandbox in development or test

# Check the configuration options
PaypalExpressCheckout.configure({
    business: '<YOUR PAYPAL ACCOUNT EMAIL>',
    return: '<RETURN URL AFTER SUCCESS PURCHASE>',
    cancel_return: '<URL TO REDIRECT WHEN PURCHASE IS CANCEL>',
    notify_url: '<URL WHERE IPN WOULD SEND PURCHASE INFORMATION>'
})

PaypalExpressCheckout.add_product({
    name: "My awesome product name",
    amount: 15, # Product's price
    quantity: 3,
    number: 1242, #SKU
})

redirect_to PaypalExpressCheckout.payment_url # generate the url that the user need to be redirected to complete the purchase
```

# Confiruation options

###### Account information
* ***business***: account email or id

###### Custom variable here we send the billing code
* ***custom***: custom data
* ***invoice***: code to identify the bill

###### API configuration ###
* ***currency_code***: "USD" e.g, check the full list here http://bit.ly/anciiH

###### Page Layout
* ***cpp_header_image***: Image header url [750 pixels wide by 90 pixels high]
* ***cpp_cart_border_color***: The HTML hex code for your principal identifying color

###### Payment Page Information
* ***return***: The URL to which PayPal redirects buyers after they complete their payments.
* ***cancel_return***: Specify a URL on your website that displays payment cancelation page
* ***notify_url***: The URL to which PayPal posts information about the payment (IPN)
* ***lc***:  Languaje [En,Es] - default En


###### Shipping and Misc Information
* ***shipping***
* ***shipping2***
* ***handling***
* ***tax***
* ***discount_amount_cart***: Discount amount [9.99]
* ***discount_rate_cart***: Discount percentage [15]

###### Customer Information
* ***first_name***
* ***last_name***
* ***address1***
* ***address2***
* ***city***
* ***state***
* ***zip***
* ***email***
* ***night_phone_a***
* ***night_phone_b***
* ***night_phone_c***

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/chukitow/paypal_express_checkout.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

