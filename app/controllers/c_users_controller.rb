class CUsersController < ApplicationController

	before_action :room_user

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
		if @user != current_c_user && @f_user
			@chatroom = Chatroom.find_by(c_user_id: @user.id ,f_user_id: @f_user)
		end
	end

	def index
	end

	def destroy
		user = CUser.find(params[:id])
		user.destroy
		redirect_to root_path
	end

	private
	def c_user_params
		params.require(:c_user).permit(:name,:image, :company, :industry, :profile, :hp_url, :email, :tell, :post_code, :address, :conv_time, :password, :encrypted_password)
	end

	def room_user
		@c_user = CUser.find(params[:id])
		if @c_user != current_c_user && current_f_user
        	Chatroom.find_or_create_by(c_user_id: @c_user.id ,f_user_id: current_f_user.id)
        else
    	end
    end

end
