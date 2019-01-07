class FavoriteStarsController < ApplicationController

	before_action :login_user

	def create
		request = Request.find(params[:request_id])
		favorite_star = FavoriteStar.new(request_id: request.id,f_user_id: current_f_user.id)
		favorite_star.save
		render json: request.id
		# redirect_back(fallback_location: request_path(request))
	end

	def destroy
		request = Request.find(params[:request_id])
		favorite_star = FavoriteStar.find_by(request_id: request.id,f_user_id: current_f_user.id)
		favorite_star.destroy
		render json: request.id
		# redirect_back(fallback_location: request_path(request))
	end

	def login_user
		if f_user_signed_in? || c_user_signed_in?
		else
			redirect_to root_path
		end
	end

end