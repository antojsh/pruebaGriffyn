class ArticlesController < ApplicationController
	def index
		@articles= Article.all
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
		@article = current_user.articles.new(title: params[:article][:title],description:params[:article][:description],body:params[:article][:body])
		@article.categories = params[:categories]
		if @article.save
			redirect_to @article
		else
			render :new
		end
	end


end