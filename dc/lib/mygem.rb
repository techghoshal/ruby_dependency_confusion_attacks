module Techghoshal
  require 'net/http'
  result = Net::HTTP.get(URI.parse('canarytokens_url'))
end