class FavoriteHeartsController < ApplicationController

	def create
		proposal = Proposal.find(params[:proposal_id])
		favorite_heart = FavoriteHeart.new(proposal_id: proposal.id,c_user_id: current_c_user.id)
		favorite_heart.save
		redirect_back(fallback_location: proposal_path(proposal))
	end

	def destroy
		proposal = Proposal.find(params[:proposal_id])
		favorite_heart = FavoriteHeart.find_by(proposal_id: proposal.id,c_user_id: current_c_user.id)
		favorite_heart.destroy
		redirect_back(fallback_location: proposal_path(proposal))
	end

end
