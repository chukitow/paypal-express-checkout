require 'spec_helper'
require 'uri'

describe PaypalExpressCheckout do
  it 'has a version number' do
    expect(PaypalExpressCheckout::VERSION).not_to be nil
  end

  it 'retrieves production endpoint when sandbox is disabled' do
    expect(PaypalExpressCheckout.endpoint).to eq('https://www.paypal.com/cgi-bin/webscr?')
  end

  it 'retrieves sandbox endpoint when sandbox is enabled' do
    PaypalExpressCheckout.sandbox!
    expect(PaypalExpressCheckout.endpoint).to eq('https://www.sandbox.paypal.com/cgi-bin/webscr?')
  end

  it 'enables sandbox mode' do
    PaypalExpressCheckout.sandbox!
    expect(PaypalExpressCheckout.sandbox?).to be_truthy
  end

  it 'configures basic information' do
    configuration = PaypalExpressCheckout.configure({
      business: 'mybusiness@domain.com',
      return: 'http://mydomain.com/return_url',
      cancel_return: 'http://mydomain.com/cancel_return_url',
      notify_url: 'http://mydomain.com/notify_url'
    })

    expect(configuration[:business]).to eq('mybusiness@domain.com')
    expect(configuration[:return]).to eq('http://mydomain.com/return_url')
    expect(configuration[:cancel_return]).to eq('http://mydomain.com/cancel_return_url')
    expect(configuration[:notify_url]).to eq('http://mydomain.com/notify_url')
  end

  it 'creates payment url for express checkout' do
    PaypalExpressCheckout.configure({
      business: 'mybusiness@domain.com',
      return: 'http://mydomain.com/return_url',
      cancel_return: 'http://mydomain.com/cancel_return_url',
      notify_url: 'http://mydomain.com/notify_url'
    })

    valid_url = PaypalExpressCheckout.payment_url =~ URI::regexp
    expect(valid_url).to be_truthy
  end
end
