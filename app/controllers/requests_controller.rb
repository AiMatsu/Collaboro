class RequestsController < ApplicationController

	before_action :login_user
	before_action :correct_user ,only:[:edit,:update,:destroy]

	def new
		@request = Request.new
	end

	def create
		@request = Request.new(request_params)
		@request.c_user_id = current_c_user.id
		if @request.save
			redirect_to request_path(@request),notice:'リクエストを追加しました！'
		else
			render :new
		end
	end

	def edit
		@request = Request.find(params[:id])
	end

	def update
		@request = Request.find(params[:id])
		if @request.update(request_params)
			redirect_to request_path(@request),notice:'リクエスト内容を変更しました！'
		else
			render :edit
		end
	end

	def show
		@request = Request.find(params[:id])
		@c_user = @request.c_user

		# #favorite_stars(bookmark)した人一覧を出したい
		@favorited_users = []
		@favorites = FavoriteStar.where(request_id: @request).reverse_order
		@favorites.each do |f|
			@favorited_user = FUser.find_by(id: f.f_user_id)
			@favorited_users.push(@favorited_user)
		end
	end

	def index

		@requests = Request.all.reverse_order

		#favorite_stars(bookmark)に登録したリクエストを取り出したい
		@favorites = FavoriteStar.where("f_user_id = ?", current_f_user).reverse_order
		@requests_fav = []
		@favorites.each do |f|
			@request = Request.find_by(id: f.request_id)
			@requests_fav.push(@request)
		end

		# カテゴリー別
		@requests_shipment = Request.where(category: "0").reverse_order
		@requests_event = Request.where(category: "1").reverse_order
		@requests_other = Request.where(category: "2").reverse_order

		# 月別
		@requests_spring = []
		@requests_summer = []
		@requests_autumn = []
		@requests_winter = []

		@requests.each do |r|
			if r.start_season.month == 3 || r.start_season.month == 4 || r.start_season.month == 5
				@requests_spring.push(r)
			elsif r.start_season.month == 6 || r.start_season.month == 7 || r.start_season.month == 8
	 			@requests_summer.push(r)
	 		elsif r.start_season.month == 9 || r.start_season.month == 10 || r.start_season.month == 11
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

	def search
		@requests = Request.page(params[:page]).reverse_order.search(params[:search])
	end

	def login_user
		if f_user_signed_in? || c_user_signed_in?
		else
		 redirect_to root_path
		end
	end

	def correct_user
		@user = Request.find(params[:id]).c_user
		redirect_to root_path unless @user == current_c_user
	end

	private
	def request_params
		params.require(:request).permit(:title, :body, :location, :category, :status, :start_season, :finish_season, )
	end

end
