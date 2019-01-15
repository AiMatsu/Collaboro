class BlogsController < ApplicationController

	before_action :login_user ,except:[:index,:show]
	before_action :correct_user ,only:[:edit,:update,:destroy]

	def new
		@blog = Blog.new
	end

	def create
		@blog = Blog.new(blog_params)
		@blog.f_user_id = current_f_user.id
		if @blog.save
			redirect_to blog_path(@blog), notice:'旬ネタを投稿しました！'
		else
			render :new
		end
	end

	def edit
		@blog = Blog.find(params[:id])
	end

	def update
		@blog = Blog.find(params[:id])
		if @blog.update(blog_params)
			redirect_to blog_path(@blog), notice:'旬ネタを変更しました！'
		else
			render :edit
		end
	end

	def show
		@blog = Blog.find(params[:id])
		@f_user = @blog.f_user
	end

	def index
		@blogs = Blog.all.reverse_order
		@blogs_harvest = Blog.where(b_category: "0").reverse_order
		@blogs_recipe = Blog.where(b_category: "1").reverse_order
		@blogs_collabo = Blog.where(b_category: "2").reverse_order
		@blogs_b_other = Blog.where(b_category: "3").reverse_order
	end

	def destroy
		blog = Blog.find(params[:id])
		if blog.destroy
			redirect_to f_user_path(blog.f_user), notice:'旬ネタを削除しました！'
		else
			render :show
	  end
	end

	def login_user
		if f_user_signed_in? || c_user_signed_in?
		else
		 redirect_to root_path
		end
	end

	def correct_user
		@user = Blog.find(params[:id]).f_user
		redirect_to root_path unless @user == current_f_user
	end

	private
	def blog_params
		params.require(:blog).permit(:f_user_id,:b_title,:b_category,:b_body,:b_image)
	end

end
