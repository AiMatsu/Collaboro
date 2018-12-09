class CUsersController < ApplicationController

	# before_action :room_user

	def edit
		@user = CUser.find(params[:id])
	end

	def update
		@user = CUser.find(params[:id])
		if @user.update(c_user_params)
		   redirect_to c_user_path(@user),notice: '基本情報を編集しました！'
		else
			render :edit
		end
	end

	def show
		@user = CUser.find(params[:id])
		@f_user = current_f_user
		@requests = @user.requests.reverse_order
	end

	def index
	end

	def destroy
		user = CUser.find(params[:id])
		user.destroy
		redirect_to root_path
	end

	# def room_user
 #      if Chatroom.where(c_user_id: params[:id]).exists?
 #      else
 #        @chatroom = Chatroom.new(c_user_id: params[:id])
 #        @chatroom.save
 #      end
 #    end

	private
	def c_user_params
		params.require(:c_user).permit(:name,:image, :company, :industry, :profile, :hp_url, :email, :tell, :post_code, :address, :conv_time, :password, :encrypted_password)
	end

end
