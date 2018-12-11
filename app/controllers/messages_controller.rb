class MessagesController < ApplicationController

	def create
		chatroom = Chatroom.find(params[:chatroom_id])
		message = Message.new(message_params)
		message.chatroom_id = chatroom.id
		if current_f_user != nil
			message.f_user = true
		else
			message.f_user = false
		end
		message.save!
		redirect_to chatroom_path(message.chatroom_id)
	end

	private
	def message_params
		params.require(:message).permit(:messenger, :text)
	end
end

