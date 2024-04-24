require 'json'
class HomeController < ApplicationController
  def index
    test = paperFiles
    puts 'test' + test[0]['Id']
  end

  private
  def paperFiles
    response = HTTParty.get('https://5f2be0b4ffc88500167b85a0.mockapi.io/suppliers/paperflies')
    # puts response.body, response.code, response.message, response.headers.inspect
    body = JSON.parse(response.body)
    # data = body[0]

    # Hotel.new(data['Id'])
  end
end
