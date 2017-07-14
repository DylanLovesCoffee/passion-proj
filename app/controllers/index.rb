get '/' do
  erb :'/index'
end

post '/' do
  email = params[:email]
  @person = fullcontact_profile(email)
  if request.xhr?
    if @person
      @photos = fullcontact_photos(@person)
      if @photos
        @attributes = face_attr(@photos.first)
      else
        @attributes = nil
      end
      erb :'/show', layout: false, locals: { person: @person, photos: @photos, attributes: @attributes }
    else
      erb :'/404'
    end
  end
end

get '/about' do
  erb :'/about'
end
