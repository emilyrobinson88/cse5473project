class PasswordsController < ApplicationController

	def index
		@passwords=Password.all
	end
	
	def show
		@password=Password.find(params[:id])
	end

	def new
		@password=Password.new
	end

	def create
		@password=Password.new(allowed_params)
		@password.save
		redirect_to @password
	end

	def edit
		@password = Password.find(params[:id])
	end

	def update
	end

	def destroy
	end
  
 



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_password
      @password = Password.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def allowed_params
      params.require(:password).permit(:pass)
    end


end
