Dotenv.load
FullContact.configure do |config|
  config.api_key = ENV['FULL_CONTACT_KEY']
end

def face_attr(image_url)
  Unirest.timeout(100)

  response = Unirest.get "https://faceplusplus-faceplusplus.p.mashape.com/detection/detect?attribute=glass%2Cpose%2Cgender%2Cage%2Crace%2Csmiling&url=" + image_url,
    headers:{
      "X-Mashape-Key" => ENV['X_MASHAPE_KEY'],
      "Accept" => "application/json"
    }

  if response.code == 200
    response_hash = JSON.parse(response.raw_body)

    # Hash of attributes(keys) and values
    attributes = response_hash['face'].first['attribute']
  end
end

def fullcontact_profile(email)
  # person object is a Hashie and has keys of status, request_id, likelihood, photos, contact_info, organizations, demographics, social_profiles
  person = FullContact.person(email: email)
  if person
    person
  else
    nil
  end
end

def fullcontact_photos(person)
  if person.status == 200
    # Array of photo urls
    photos = []
    if person.photos
      person.photos.each do |info|
        photos.push(info.url)
      end
      return photos
    else
      nil
    end
  end
end
