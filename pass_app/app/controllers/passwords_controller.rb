class PasswordsController < ApplicationController
	before_action :set_password, only: [:show, :edit, :update, :destroy]
	def index
		@passwords=Password.all
	end

	def show
		@password=Password.find(params[:id])
	end

	def new
		puts "password new"
		@password=Password.new(:count => 0)
		@password.save
	end

	def create
		puts "password create"
		@password = Password.find_by(allowed_params)
		ip = request.remote_ip
		if !@password.nil?
			currCount = @password[:count]
			@password.update(:count => currCount + 1)
			@ip = IpAddress.new(:ipa => ip, :password => @password.pass)
			@ip.save
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
			@ip = IpAddress.new(:ipa => ip, :password => @password.pass)
			@ip.save
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
		@password.update(allowed_params)
		ip = request.remote_ip
		@ip = IpAddress.new(:ipa => ip, :password => @password.pass)
		@ip.save
		matches = Password.where(:pass => @password.pass)
		puts matches.count
		if matches.count > 1
			@password.destroy
			new_count = matches[0].count + 1
			matches[0].update_attribute(:count, new_count)
			respond_to do |format|
				format.html { redirect_to matches[0] }
				format.json { render :show, status: :ok, location: matches[0] }
			end
		else
			@password.update_attribute(:count, 1)
			respond_to do |format|
				format.html { redirect_to @password }
				format.json { render :show, status: :ok, location: @password }
			end
		end
		# if matches has more than 1, @password.destroy and other match update_attribute(:count, old_count + 1)
		# puts "password update"
		# respond_to do |format|
		# 	if @password.update(allowed_params)
		# 		puts @password.pass
		# 		ip = request.remote_ip
		# 		@ip = IpAddress.new(:ipa => ip, :password => @password.pass)
		# 		@ip.save
		# 		format.html { redirect_to @password }
		# 		format.json { render :show, status: :ok, location: @password }
		# 	else
		# 		format.html { render :edit }
		# 		format.json { render json: @password.errors, status: :unprocessable_entity }
		# 	end
		# end
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
		params.require(:password).permit(:pass)
	end


end