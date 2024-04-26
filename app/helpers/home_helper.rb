module HomeHelper
  def getResponseBody url
    response = HTTParty.get(url)
    # puts response.body, response.code, response.message, response.headers.inspect
    body = JSON.parse(response.body)
    data = body
  end
end
