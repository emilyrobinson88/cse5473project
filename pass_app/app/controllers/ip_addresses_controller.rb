class IpAddressesController < ApplicationController
  def new
    @IpAddress= IpAddress.new(params.require(:ipa, :password))
    @IpAddress.save
  end
  def create
    @IpAddress= IpAddress.new(params.require(:ipa, :password))
    @IpAddress.save
  end
  def index
    @IpAddresses=IpAddress.all
  end
  def show
    @IpAddress=IpAddress.find(params[:id])
  end
end
