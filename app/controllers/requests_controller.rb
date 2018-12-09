class RequestsController < ApplicationController

	def new
		@request = Request.new
	end

	def create
		request = Request.new(request_params)
		request.c_user_id = current_c_user.id
		if request.save
			redirect_to c_user_path(current_c_user),notice:'リクエストを追加しました！'
		else
			render :new
		end
	end

	def edit
		@request = Request.find(params[:id])
	end

	def update
		request = Request.find(params[:id])
		if request.update(request_params)
			redirect_to c_user_path(current_c_user),notice:'リクエスト内容を変更しました！'
		else
			render :edit
		end
	end

	def show
		@request = Request.find(params[:id])
		@c_user = @request.c_user
	end

	def index
		@requests = Request.all.reverse_order

		# カテゴリー別
		@requests_shipment = Request.where(r_category: "0").reverse_order
		@requests_event = Request.where(r_category: "1").reverse_order
		@requests_other = Request.where(r_category: "2").reverse_order

		# 月別
		@requests_spring = []
		@requests_summer = []
		@requests_autumn = []
		@requests_winter = []

		@requests.each do |r|
			if r.r_start_season.month == 3 || r.r_start_season.month == 4 || r.r_start_season.month == 5
				@requests_spring.push(r)
			elsif r.r_start_season.month == 6 || r.r_start_season.month == 7 || r.r_start_season.month == 8
	 			@requests_summer.push(r)
	 		elsif r.r_start_season.month == 9 || r.r_start_season.month == 10 || r.r_start_season.month == 11
	 			@requests_autumn.push(r)
	 		else
	 			@requests_winter.push(r)
			end
		end
	end

	def destroy
		request = Request.find(params[:id])
		if request.destroy
			redirect_to c_user_path(current_c_user),notice:"リクエストを削除しました！"
	    end
	end

	private
	def request_params
		params.require(:request).permit(:r_title, :r_body, :r_location, :r_category, :r_status, :r_start_season, :r_finish_season, )
	end

end
