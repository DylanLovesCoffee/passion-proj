get '/' do
  erb :'/index'
end

post '/' do
  @image_url = params[:fileToUpload]
  if sad?(@image_url)
    erb :'/sad'
  else
    erb :'/happy'
  end
end
