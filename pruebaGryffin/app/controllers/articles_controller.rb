class ArticlesController < ApplicationController

	def index
		@articles= Article.where('role_id',current_user.role_id)
	end
	def show
		@article = Article.find(params[:id])
	end
	def new
		@article = Article.new
		@categories = Category.all
		@permissions= Permission.all
	end
	def create
		@article = current_user.articles.new(body:params[:article][:body],role_id:params[:article][:role_id])
		@article.categories = params[:categories]
		if @article.save
			redirect_to @article
		else
			render :new
		end
	end
	


end