class PasswordsController < ApplicationController

	def index
	end
	
	def show
	end

	def new
	end

	def create
		@password=Password.new(params[:password])
		@password.save
		redirect_to @password
	end

	def edit
	end

	def update
	end

	def destroy
	end



end
