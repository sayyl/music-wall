# Homepage (Root path)
get '/' do
  erb :index
end

 get '/music' do
  @music = Music.all
    erb :'music/index'
end

get '/music/new' do
  erb :'music/new'
end