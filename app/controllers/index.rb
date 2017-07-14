get '/' do
  erb :'/index'
end

post '/' do
  email = params[:email]
  @person = fullcontact_profile(email)
  @photos = fullcontact_photos(@person)
  @attributes = face_attr(@photos.first)
  erb :'/show'
end
