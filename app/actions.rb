helpers do
  def current_user
#    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    User.find { |u| u[:id] == session[:user_id] } if session[:user_id]
  end
end

# Homepage (Root path)
get '/' do
  session[:user_id]
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
    url: params[:url],
    )
  
  if @musics.save
    redirect '/music'
  else
    erb :'music/new'
  end

end

##USER STUFF####

get '/sign_up' do
  @user = User.new
  erb :'sign_up'
end 

post '/sign_up' do
  @user = User.new(
    email: params[:email],
    password: params[:password]
  )

  if @user.save
    session[:user_id] = @user.id
    redirect '/'
  else
    erb :'sign_up'
  end
end

post '/log_in' do
  user = User.find { |u| u[:username] == params[:username] }
  if user && user[:password] == params[:password]
    session[:user_id] = user[:id] 
  end
  redirect '/'
end

get '/log_out' do
##   session[:user_id] = nil
   session.clear
  redirect '/'
end



