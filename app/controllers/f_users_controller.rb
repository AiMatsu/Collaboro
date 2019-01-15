class FUsersController < ApplicationController

	before_action :login_user
	before_action :correct_user ,except: [:show]
	before_action :room_user

	def edit
		@user = FUser.find(params[:id])
	end

	def update
		@user = FUser.find(params[:id])
		if @user.update(f_user_params)
			redirect_to @user,notice: '基本情報を編集しました！'
		else
			render :edit
		end
	end

	def show
		@user = FUser.find(params[:id])
		@c_user = current_c_user
		@blogs = @user.blogs.reverse_order
		@proposals = @user.proposals.reverse_order
		if @user != current_f_user && @c_user
			@chatroom = Chatroom.find_by(f_user_id: @user.id ,c_user_id: @c_user)
	    end
	    @crops_calendars = @user.crops_calendars
	end

	def destroy
		user = FUser.find(params[:id])
		user.destroy
		redirect_to :root
	end

	def room_user
		@f_user = FUser.find(params[:id])
		if @f_user != current_f_user && current_c_user
        	Chatroom.find_or_create_by(f_user_id: @f_user.id ,c_user_id: current_c_user.id)
        end
    end

  def login_user
		if f_user_signed_in? || c_user_signed_in?
		else
			redirect_to :root
		end
	end

  def correct_user
		@user = FUser.with_deleted.find(params[:id])
		redirect_to :root unless @user == current_f_user
	end

	private
	def f_user_params
		params.require(:f_user).permit(:name, :image, :farm, :profile, :hp_url, :tell, :post_code, :address, :conv_time, )
	end

end
