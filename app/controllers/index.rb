require 'unirest'
require 'dotenv'
require 'pry'
require 'net/http'
require 'uri'
require 'open-uri'

# kittens = open("https://faceplusplus-faceplusplus.p.mashape.com/detection/detect?attribute=glass%2Cpose%2Cgender%2Cage%2Crace%2Csmiling&url=https%3A%2F%2Favatars3.githubusercontent.com%2Fu%2F25290232%3Fv%3D3%26s%3D460",
#    "X-Mashape-Key" => "96CB4qThPbmshajRKhMloWQqgPppp1iue5gjsnOPJbiI9RAd6e",
#    "Accept" => "application/json"
#  )
# binding.pry
# p kittens

img_url = "avatars3.githubusercontent.com/u/25290232?v=3&s=460"

Unirest.timeout(100)

response = Unirest.get "https://faceplusplus-faceplusplus.p.mashape.com/detection/detect?attribute=glass%2Cpose%2Cgender%2Cage%2Crace%2Csmiling&url=https%3A%2F%2F" + img_url,
  headers:{
    "X-Mashape-Key" => "96CB4qThPbmshajRKhMloWQqgPppp1iue5gjsnOPJbiI9RAd6e",
    "Accept" => "application/json"
  }

# if response.code == 200
  raw_res = response.raw_body
  response_hash = JSON.parse(raw_res)
  # binding.pry
  attributes = response_hash['face'].first['attribute']
  puts "Smiling: #{attributes['smiling']['value']}"
# else
# end

# https://faceplusplus-faceplusplus.p.mashape.com/detection/detect?attribute=glass%2Cpose%2Cgender%2Cage%2Crace%2Csmiling&url=https%3A%2F%2F
