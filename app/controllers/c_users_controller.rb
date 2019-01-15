class CUsersController < ApplicationController

	before_action :login_user
	before_action :correct_user ,except: [:show]
	before_action :room_user

	def edit
		@user = CUser.find(params[:id])
	end

	def update
		@user = CUser.find(params[:id])
		if @user.update(c_user_params)
		   redirect_to @user, notice: '基本情報を編集しました！'
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

	def destroy
		user = CUser.find(params[:id])
		user.destroy
		redirect_to :root
	end

	def room_user
		@c_user = CUser.find(params[:id])
		if @c_user != current_c_user && current_f_user
        	Chatroom.find_or_create_by(c_user_id: @c_user.id ,f_user_id: current_f_user.id)
        end
    end

    def login_user
		if f_user_signed_in? || c_user_signed_in?
		else
		 redirect_to :root
		end
	end

	def correct_user
		@user = CUser.with_deleted.find(params[:id])
		redirect_to :root unless @user == current_c_user
	end

	private
	def c_user_params
		params.require(:c_user).permit(:name,:image, :company, :industry, :profile, :hp_url, :email, :tell, :post_code, :address, :conv_time, :password, :encrypted_password)
	end

end
