get '/' do
  erb :'/index'
end

post '/' do
  email = params[:email]
  @person = fullcontact_profile(email)
    if @person
      @photos = fullcontact_photos(@person)
      if @photos
        @attributes = face_attr(@photos.first)
      else
        @attributes = nil
      end
      erb :'/show'
  else
    erb :'/404'
  end
end

get '/about' do
  erb :'/about'
end

# kqm001@bucknell.edu
