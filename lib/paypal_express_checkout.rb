require "paypal_express_checkout/version"
require 'active_support/core_ext/hash'

module PaypalExpressCheckout
  ENDPOINT = {
    production: 'https://www.paypal.com/cgi-bin/webscr?',
    sandbox: 'https://www.sandbox.paypal.com/cgi-bin/webscr?'
  }

  def self.endpoint
    sandbox? ? PaypalExpressCheckout::ENDPOINT[:sandbox] : PaypalExpressCheckout::ENDPOINT[:production]
  end

  def self.sandbox?
    @@sandbox
  end

  def self.sandbox!
    self.sandbox = true
  end

  def self.sandbox=(boolean)
    @@sandbox = boolean
  end

  def self.configure(options = {})
    #Account information
		@@config[:business] 	  = ''      #Account email or id
		@@config[:cmd] 			    = '_cart' #Do not modify

    #Custom variable here we send the billing code-->
		@@config[:custom]	 = ''
		@@config[:invoice] = '' #Code to identify the bill

    #API Configuration
		@@config[:upload] 		    = '1'   #Do not modify
		@@config[:currency_code]  = 'USD' #http://bit.ly/anciiH
		@@config[:disp_tot]       = 'Y'

    #Page Layout
		@@config[:cpp_header_image] 		  = ''     #Image header url [750 pixels wide by 90 pixels high]
		@@config[:cpp_cart_border_color] 	= '000'  #The HTML hex code for your principal identifying color
		@@config[:no_note]                = 1      #[0,1] 0 show, 1 hide

    #Payment Page Information
		@@config[:return] 			  = ''   #The URL to which PayPal redirects buyersÃ¢â‚¬â„¢ browser after they complete their payments.
		@@config[:cancel_return]	= ''   #Specify a URL on your website that displays a Ã¢â‚¬Å“Payment CanceledÃ¢â‚¬Â page.
		@@config[:notify_url] 		= ''   #The URL to which PayPal posts information about the payment (IPN)
		@@config[:rm]             = '2'  #Leave this to get payment information
		@@config[:lc]             = 'En' #Languaje [EN,ES]

    #Shipping and Misc Information
		@@config[:shipping] 	           = ''
		@@config[:shipping2] 	           = ''
		@@config[:handling] 	           = ''
		@@config[:tax] 			             = ''
		@@config[:discount_amount_cart]  = 0 #Discount amount [9.99]
		@@config[:discount_rate_cart] 	 = '' #Discount percentage [15]

    #Customer Information
		@@config[:first_name] 		= ''
		@@config[:last_name] 		  = ''
		@@config[:address1] 		  = ''
		@@config[:address2] 		  = ''
		@@config[:city] 			    = ''
		@@config[:state] 			    = ''
		@@config[:zip] 				    = ''
		@@config[:email] 			    = ''
		@@config[:night_phone_a] 	= ''
		@@config[:night_phone_b] 	= ''
		@@config[:night_phone_c] 	= ''

    options.each do |key, val|
      @@config[key.to_sym] = val
    end
  end

  def self.add_product(item)
    @@config["item_name_#{@@item}".to_sym]    = item[:name]
    @@config["amount_#{@@item}".to_sym]       = item[:amount]
    @@config["quantity_#{@@item}".to_sym]     = item[:quantity]
    @@config["item_number_#{@@item}".to_sym]  = item[:number]
    @@item+= 1
  end

  def self.payment_url
    "#{self.endpoint}#{@@config.to_query}"
  end

  self.sandbox = false
  @@config     = {}
  @@item       = 1;
end
