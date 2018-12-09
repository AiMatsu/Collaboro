class FUsersController < ApplicationController

	# before_action :room_user

	def edit
		@user = FUser.find(params[:id])
	end

	def update
		@user = FUser.find(params[:id])
		if @user.update(f_user_params)
		   redirect_to f_user_path(@user),notice: '基本情報を編集しました！'
		else
			render :edit
		end
	end

	def show
		@user = FUser.find(params[:id])
		@c_user = current_c_user
		@blogs = @user.blogs.reverse_order
		@proposals = @user.proposals.reverse_order
	end

	def index
	end

	def destroy
		user = FUser.find(params[:id])
		user.destroy
		redirect_to root_path
	end

	# def room_user
 #      if Chatroom.where(f_user_id: params[:id]).exists?
 #      else
 #        @chatroom = Chatroom.new(f_user_id: params[:id])
 #        @chatroom.save
 #      end
 #    end

	private
	def f_user_params
		params.require(:f_user).permit(:name, :image, :farm, :profile, :hp_url,:email, :tell, :post_code, :address, :conv_time, :password,:encrypted_password)
	end

end
