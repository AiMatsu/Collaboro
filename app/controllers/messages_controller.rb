class MessagesController < ApplicationController

	def create
		@chatroom = Chatroom.find(params[:chatroom_id])
		@message = Message.new(message_params)
		@message.chatroom_id = @chatroom.id
		@messages = @chatroom.messages
		@f_user = FUser.find(@chatroom.f_user.id)
		@c_user = CUser.find(@chatroom.c_user.id)
		if current_f_user != nil
			@message.f_user = true
		else
			@message.f_user = false
		end
		if @message.save
			flash[:notice] = "メッセージが送信されました"
			render partial:'messages/messages', locals: { messages: @messages }
		else
			flash[:notice] = "メッセージが送信されませんでした"
			render partial:'messages/error_messages', locals: { messages: @messages }
		end
	end

	private
	def message_params
		params.require(:message).permit(:messenger, :text)
	end
end

