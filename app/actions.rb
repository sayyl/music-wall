# Homepage (Root path)
get '/' do
  erb :index
end

 get '/music' do
  @musics = Music.all
    erb :'music/index'
end

get '/music/new' do
  erb :'music/new'
end

#method action
#get/post [path to which you're sending the form]
post '/music' do
  @musics = Music.new(
    song_title: params[:song_title],
    author: params[:author],
    url: params[:url]
    )
  
  if @musics.save
    redirect '/music'
  else
    erb :'music/new'
  end

end




