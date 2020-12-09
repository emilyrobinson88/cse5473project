class PasswordsController < ApplicationController
before_action :set_password, only: [:show, :edit, :update, :destroy]
	def index
		@passwords=Password.all
	end
	
	def show
		@password=Password.find(params[:id])
	end

	def new
		@password=Password.new(:count => 1)
		#ip = request.remote_ip
		#IpAddress.new(:ipa => ip, :password => @password.pass)
		@ipaddress= IpAddress.new
		@password.save
		@ipaddress.save
	end

	def create
		@password = Password.find_by(allowed_params)
		#ip = request.remote_ip
		if !@password.nil?
			currCount = @password[:count]
			@password.update(:count => currCount + 1)
			#@ipaddress= IpAddress.new
			respond_to do |format|
				if @password.save
					format.html { redirect_to @password }
					format.json { render :show, status: :created, location: @password }
				else
					format.html { render :new }
					format.json { render json: @password.errors, status: :unprocessable_entity }
				end
			end
		else
			@password=Password.new(allowed_params)
			@password.update(:count => 1)
			#@ipaddress= IpAddress.new
			respond_to do |format|
				if @password.save
					format.html { redirect_to @password }
					format.json { render :show, status: :created, location: @password }
				else
					format.html { render :new }
					format.json { render json: @password.errors, status: :unprocessable_entity }
				end
			end
    end
	end

	def edit
		@password = Password.find(params[:id])
		
	end

	def update
		respond_to do |format|
			puts allowed_params

			if @password.update(allowed_params)
				format.html { redirect_to @password }
				format.json { render :show, status: :ok, location: @password }
			else
				format.html { render :edit }
				format.json { render json: @password.errors, status: :unprocessable_entity }
			end
		end
	end

	def destroy
		@password.destroy
    	respond_to do |format|
    	  format.html { redirect_to passwords_url, notice: 'password was successfully destroyed.' }
     	  format.json { head :no_content }
    end
	end
  
 



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_password
      @password = Password.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def allowed_params
      params.require(:password).permit(:pass, ipaddress_attributes: [:ipa,:password])
    end


end
