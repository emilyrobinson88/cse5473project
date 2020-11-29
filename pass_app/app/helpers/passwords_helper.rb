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
		ret = hour.round(5)
		if ret == 0
			return "Instant"
		end
		return ret
	end
	def day(password)
		day = bruteforce(password)/24
		ret = day.round(5)
		if ret == 0
			return "Instant"
		end
		return ret
	end
	def week(password)
		week = bruteforce(password)/(24*7)
		ret = week.round(5)
		if ret == 0
			return "Instant"
		end
		return ret
	end

	def upCount(password)
		up=password.count("A-Z")
		if(up<=2)
			return "Try adding more uppercase letters to your password"
		else
			return 3
		end
	end

	def loCount(password)
		lo=password.count("a-z")
		if(lo<=2)
			return "Try adding more lowercase letters to your password"
		else
			return 3
		end
	end

	def numCount(password)
		n=password.count("0-9")
		if(n<=2)
			return "Try adding more numbers to your password"

		else
			return 3
		end
	end

	def symCount(password)
		sy=password.count("!#$%&()*+,:;<=>?")
		if(sy<=2)
			return "Try adding more symbols to your password"
		else
			return 3
		end
	end

	def lenCount(password)
		len=password.length
		if(len<9)
			return "Try making your password longer"
		else
			return 3
		end
	end


	def num(password)
		v= bruteforce(password)
		return v
	end

	def naive(password)
		return 94**(password.length)
	end

	def pass_strength(password)
		up=password.count("A-Z") #possible values for uppercase letters
		lo=password.count("a-z") #possible values for lowercase letters
		nu=password.count("0-9")  #possible values for number
		sy=password.length - up - lo - nu
		
		repeats = repeating_characters(password)
		mixing = number_symbol_placement(password)
		base = pass_strength_simple(password)
		
		overall_password_strength = base / 5 ** repeats / (2 ** (nu + sy - mixing))
		return overall_password_strength
	end

	#This just takes note of all of the character "types" and creates the appropriate
	#base based on that information and then it puts that base to the power of the 
	#length of the password
	def pass_strength_simple(password)
		up= password.count("A-Z") #possible values for uppercase letters
		lo= password.count("a-z") #possible values for lowercase letters
		nu= password.count("0-9")  #possible values for number
		sy= password.length - up - lo - nu
		sum = 0
		if 0 < up
			sum += 26
		end
		if 0 < lo
			sum += 26
		end
		if 0 < nu
			sum += 10
		end 
		if 0 < sy
			sum += 32
		end
		return sum ** password.length
	end

	#This function returns a list whose elements are the lengths of each 
	#string of the same character of at least length 2
	#For example: 
	#	EEE 			returns [3]
	#	AAABBCCCC 		returns [3,2,4]
	#	ABCDEEFG 		returns [2]
	def repeating_characters(password)
		repeating_list = []
		current_streak = 1
		index = 1
		while index < password.length
			if password[index - 1] == password[index]
				current_streak += 1
			else
				if(1 < current_streak)
					repeating_list.append(current_streak)
				end
				current_streak = 1
			end
			index += 1
		end
		if(1 < current_streak)
			repeating_list.append(current_streak)
		end
		if repeating_list.length() == 0
			return 0
		end
		return repeating_list.inject(:+)
	end

	#This function finds the degree of separation between numbers/symbols and letters
	#It counts how many numbers/symbols are between the first occurrence of a letter 
	#and the last occurrence of a letter
	def number_symbol_placement(password)
		firstLetter = -1
		lastLetter = -1
		count = 0
		index = 0
		while index < password.length
			c = password[index]
			if ("A".."Z").include?(c) || ("a".."z").include?(c)
				if(firstLetter == -1)
					firstLetter = index
				end
				lastLetter = index
			end
			index += 1
		end
		index = firstLetter
		if 0<= firstLetter
			while index < lastLetter
				c = password[index]
				if !(("A".."Z").include?(c) || ("a".."z").include?(c))
					count += 1
				end
				index += 1
			end
		end
		return count
	end

	
end


