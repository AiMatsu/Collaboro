class ChatroomsController < ApplicationController

	before_action :user_chatroom, only:[:show]

	# def create
	# end

	# def update
	# end

	def show
	end

	def index
	end

	def user_chatroom
	      if Chatroom.where(f_user_id: params[:id]).exists?
	      else
	        @chatroom = Chatroom.new(f_user_id: params[:id])
	        @chatroom.save
	      end
    end
end
