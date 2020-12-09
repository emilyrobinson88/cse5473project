class Password < ApplicationRecord
	has_many :ip_address
	#accepts_nested_attributes_for :ip_address
	
end
