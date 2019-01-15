class ProposalsController < ApplicationController

	before_action :login_user
	before_action :correct_user ,only:[:edit,:update,:destroy]

	def new
		@proposal = Proposal.new
	end

	def create
		@proposal = Proposal.new(proposal_params)
		@proposal.f_user_id = current_f_user.id
		if @proposal.save
			redirect_to @proposal, notice:'プロポーザルを追加しました！'
		else
			render :new
		end
	end

	def edit
		@proposal = Proposal.find(params[:id])
	end

	def update
		@proposal = Proposal.find(params[:id])
		if @proposal.update(proposal_params)
			redirect_to @proposal, notice:'プロポーザル内容を変更しました！'
		else
			render :edit
		end
	end

	def show
		@proposal = Proposal.find(params[:id])
		@f_user = @proposal.f_user

		# favorite_hearts(bookmark)した人一覧を出したい
		@favorited_users = []
		@favorited = FavoriteHeart.where(proposal_id: @proposal).reverse_order
		@favorited.each do |f|
			@favorited_user = CUser.find_by(id: f.c_user_id)
			@favorited_users.push(@favorited_user)
		end
	end

	def index
		@proposals = Proposal.all.reverse_order

		#favorite_hearts(bookmark)に登録したプロポーザルを取り出したい
		@favorites = FavoriteHeart.where("c_user_id = ?", current_c_user).reverse_order
		@proposals_fav = []
		@favorites.each do |f|
			@proposal = Proposal.find_by(id: f.proposal_id)
			@proposals_fav.push(@proposal)
		end

		# カテゴリー別
		@proposals_shipment = Proposal.where(category: "0").reverse_order
		@proposals_event = Proposal.where(category: "1").reverse_order
		@proposals_other = Proposal.where(category: "2").reverse_order

		# 月別
		@proposals_spring = []
		@proposals_summer = []
		@proposals_autumn = []
		@proposals_winter = []

		@proposals.each do |p|
			if p.start_season.month == 3 || p.start_season.month == 4 || p.start_season.month == 5
				@proposals_spring.push(p)
			elsif p.start_season.month == 6 || p.start_season.month == 7 || p.start_season.month == 8
	 			@proposals_summer.push(p)
	 		elsif p.start_season.month == 9 || p.start_season.month == 10 || p.start_season.month == 11
	 			@proposals_autumn.push(p)
	 		else
	 			@proposals_winter.push(p)
			end
		end
	end

	def destroy
		proposal = Proposal.find(params[:id])
		if proposal.destroy
			redirect_to current_f_user, notice:"プロポーザルを削除しました！"
		end
	end

	def search
		@proposals = Proposal.all.reverse_order.search(params[:search])
	end

	def login_user
		if f_user_signed_in? || c_user_signed_in?
		else
			redirect_to :root
		end
	end

	def correct_user
		@user = Proposal.find(params[:id]).f_user
		redirect_to :root unless @user == current_f_user
	end

	private
	def proposal_params
		params.require(:proposal).permit(:title, :body, :p_image, :location, :category, :status, :start_season, :finish_season, )
	end

end
