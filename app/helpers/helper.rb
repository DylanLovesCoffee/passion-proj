def sad?(image_url)
  Dotenv.load
  Unirest.timeout(100)

  response = Unirest.get "https://faceplusplus-faceplusplus.p.mashape.com/detection/detect?attribute=glass%2Cpose%2Cgender%2Cage%2Crace%2Csmiling&url=" + image_url,
    headers:{
      "X-Mashape-Key" => ENV['X_MASHAPE_KEY'],
      "Accept" => "application/json"
    }

  # if response.code == 200
    raw_res = response.raw_body
    response_hash = JSON.parse(raw_res)
    # binding.pry
    attributes = response_hash['face'].first['attribute']
    if attributes['smiling']['value'] < 50
      return true
    else
      return false
    end
  # else
  # end
end
