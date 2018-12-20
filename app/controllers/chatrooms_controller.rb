class ChatroomsController < ApplicationController

	before_action :login_user
	before_action :correct_user, only: [:show]

	def show
		@chatroom = Chatroom.find(params[:id])
		@f_user = FUser.find(@chatroom.f_user.id)
		@c_user = CUser.find(@chatroom.c_user.id)
		@message = Message.new
		@messages = @chatroom.messages

	end

	def index
		@f_user = current_f_user
		@c_user = current_c_user
		if @f_user
			@chatrooms = @f_user.chatrooms.reverse_order
		elsif @c_user
			@chatrooms = @c_user.chatrooms.reverse_order
		end
	end

	def login_user
		if f_user_signed_in? || c_user_signed_in?
		else
		 redirect_to root_path
		end
	end

	def correct_user
		@c_user = Chatroom.find(params[:id]).c_user
		@f_user = Chatroom.find(params[:id]).f_user
		redirect_to chatrooms_path unless @c_user == current_c_user || @f_user == current_f_user
	end
end
