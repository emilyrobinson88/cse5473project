module PasswordsHelper
	def bruteforce(password)
		up=26**password.count("A-Z") #possible values for uppercase letters
		lo=26**password.count("a-z") #possible values for lowercase letters
		nu=10**password.count("0-9")  #possile values for number
		sy=32**password.count("!#$%&()*+,:;<=>?") #possible values for symbols
		len = password.length
		if(up==0)
			up=1
		end
		if(lo==0)
			lo=1
		end
		if(nu==0)
			nu=1
		end
		if(sy==0)
			sy=1
		end
		total=up*lo*nu*sy #finding the total number of combinations of letters, numbers and symbols
		total=total*1.0/2
		x=2*2**33 #number of keys a desktop computer can try in an hour
		hour = total/x*1.0 #how many hours it would take to brute force
		return hour
	end

	def hour(password)
		hour = bruteforce(password)
		ret=  "this would take #{hour} hours to brute force this password"
		return ret
	end
	def day(password)
		day = bruteforce(password)/24
		ret=  "this would take #{day} days to brute force this password"
		return ret
	end
	def week(password)
		week = bruteforce(password)/(24*7)
		ret=  "this would take #{week} weeks to brute force this password"
		return ret
	end
end
