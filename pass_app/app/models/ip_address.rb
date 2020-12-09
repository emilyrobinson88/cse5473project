class IpAddress < ApplicationRecord
	belongs_to :password
	accepts_nested_attributes_for :password
end
