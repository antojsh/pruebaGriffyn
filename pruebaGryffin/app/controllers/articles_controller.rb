class ArticlesController < ApplicationController

	def index
		@articles= Article.where('role_id=? OR role_id=?',current_user.role_id,1)
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
		if params.has_key?(:categories)
			@article = current_user.articles.new(body:params[:article][:body],role_id:params[:article][:role_id])
			@article.categories = params[:categories]
			if @article.save
				redirect_to @article
			else
				render :new
			end
		else
			redirect_to "/articles/new", alert: 'Necesitas seleccionar una categoria' 
		end
	end
	


end