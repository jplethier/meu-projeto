require 'rubygems'
require 'ezcrypto'
require 'json'
require 'cgi'
require 'base64'

module Uservoice
  class Token
    attr_accessor :data
    
    USERVOICE_ACCOUNT_KEY = "dealwitme"
    USERVOICE_API_KEY = "0aedfa158103332f393259cd021d2c0e"
    
    def initialize(options = {})
      options.merge!({:expires => (Time.zone.now.utc + 5 * 60).to_s})
      
      key = EzCrypto::Key.with_password USERVOICE_ACCOUNT_KEY, USERVOICE_API_KEY
      encrypted = key.encrypt(options.to_json)
      @data = Base64.encode64(encrypted).gsub(/\n/,'') # Remove line returns where are annoyingly placed every 60 characters
      # If you are not using rails url helpers to add the token to the url then you will also need to url encode it
      # @data = CGI.escape(@data)
    end
    
    def to_s
      @data
    end
  end
end