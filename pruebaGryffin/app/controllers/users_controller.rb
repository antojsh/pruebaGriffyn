class UsersController < ApplicationController
	def index
	  @users = User.all
	end
	def show
	  @user = User.find(params[:id])
	   if current_user == @user
	  	@articles2 = Article.where('user_id = ?',current_user.id)
	   else
	   	@articles2 = Article.where('user_id=? and role_id !=?',params[:id],2)
	   end
	end
	def assign
		@user = User.new
	end 
	def edit
	end
end
