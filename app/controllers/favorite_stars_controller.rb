class FavoriteStarsController < ApplicationController

	def create
		request = Request.find(params[:request_id])
		favorite_star = FavoriteStar.new(request_id: request.id,f_user_id: current_f_user.id)
		favorite_star.save
		redirect_back(fallback_location: request_path(request))
	end

	def destroy
		request = Request.find(params[:request_id])
		favorite_star = FavoriteStar.find_by(request_id: request.id,f_user_id: current_f_user.id)
		favorite_star.destroy
		redirect_back(fallback_location: request_path(request))
	end

end