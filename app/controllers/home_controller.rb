class HomeController < ApplicationController
  def index
    response = HTTParty.get('https://5f2be0b4ffc88500167b85a0.mockapi.io/suppliers/acme')
    puts response.body, response.code, response.message, response.headers.inspect
  end
end
