#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"			
end

get '/about' do
	erb :about
end

get '/visit' do
	erb :visit
end

get '/contacts' do
	erb :contacts
end

post '/visit' do
	@username = params[:username]
	@phone = params[:phone]
	@datetime = params[:datetime]
	@barber = params[:select_barber]

	if @username.length > 0 && @phone.length > 0 && @datetime.length > 0
		x = File.open("public/users.txt", "a") 
		x.puts "#{@username}, #{@phone}, #{@datetime}, #{@barber}" 
		x.close
		@success = "Вы успешно записались на прием, до встречи!"
	else
		@error = "Введите все поля!"
	end
	halt erb :visit

end

post '/contacts' do
	@email = params[:usermail]
	@usermessage = params[:message_area]

	if @email.length > 0 && @usermessage.length > 0
		x = File.open("public/contacts.txt", "a") 
		x.puts "#{@email}\n #{@usermessage}" 
		x.close
		@success = "Ваше сообщение отправлено!"
	else
		@error = "Введите все поля!"
	end
	halt erb :contacts
end