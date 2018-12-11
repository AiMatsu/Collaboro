class ChatroomsController < ApplicationController

	def show
		@chatroom = Chatroom.find(params[:id])
		@f_user = FUser.find(@chatroom.f_user.id)
		@c_user = CUser.find(@chatroom.c_user.id)
		@message_new = Message.new
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
end
