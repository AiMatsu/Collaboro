class CropsCalendarsController < ApplicationController

	before_action :login_user
	before_action :correct_user ,only:[:edit,:update,:destroy]

	def new
		@crops_calendar = CropsCalendar.new
	end

	def create
		@crops_calendar = CropsCalendar.new(crops_calendar_params)
		@crops_calendar.f_user_id = current_f_user.id
		if @crops_calendar.save
			redirect_to f_user_path(current_f_user)
		else
			render :new
		end
	end

	def edit
		@crops_calendar = CropsCalendar.find(params[:id])
	end

	def update
		@crops_calendar = CropsCalendar.find(params[:id])
		if @crops_calendar.update(crops_calendar_params)
		   redirect_to f_user_path(current_f_user),notice: '作物情報を更新しました！'
		else
			render :edit
		end
	end

	def destroy
		crops_calendar = CropsCalendar.find(params[:id])
		crops_calendar.destroy
		redirect_to f_user_path(current_f_user),notice: '作物情報を更新しました！'
	end

	private
	def crops_calendar_params
		params.require(:crops_calendar).permit(:f_user_id,:crops,:Jan,:Feb,:Mar,:Apr,:May,:Jun,:Jul,:Aug,:Sep,:Oct,:Nov,:Dec)
	end

	def login_user
		if f_user_signed_in? || c_user_signed_in?
		else
		 redirect_to root_path
		end
	end

	def correct_user
		@user = CropsCalendar.find(params[:id]).f_user
		redirect_to root_path unless @user == current_f_user
	end

end
