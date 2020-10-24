import time
import string
import sys

def PasswordStrength(password):
    num_lowercase = 0
    num_capital = 0
    num_special = 0
    num_numbers = 0    
    for c in password:
        if c.islower():
            num_lowercase += 1
        elif c.isupper():
            num_capital += 1
        elif c.isnumeric():
            num_numbers += 1
        else:
            num_special += 1
    naive_strength = PasswordStrengthNaive(password)
    simple_strength = PasswordStrengthSimple(password, num_lowercase, num_capital, num_numbers, num_special)
    print('The naive brute force approach could take up to %d guesses' % naive_strength)
    print('A brute force approach with knowledge of which character types you used could take up to %d guesses' % simple_strength)
    Proportions(password, num_lowercase, num_capital, num_numbers, num_special)
    top_million = PasswordStrengthDictionary(password)
    repeats = RepeatingCharacters(password)
    num_sym_middle = NumberSymbolPlacement(password)
    overall_password_strength = top_million * (simple_strength / (5 ** repeats) / (2 ** (num_special + num_numbers - num_sym_middle)))
    print('Your overall password strength is %d' % overall_password_strength)
    #print(simple_strength / overall_password_strength)
    if overall_password_strength < 1E12:
        print('Your password is bad')
    elif overall_password_strength < 1E18:
        print('Your password is okay')
    elif overall_password_strength < 1E24:
        print('Your password is good')
    elif overall_password_strength < 1E34:
        print('Your password is great')
    else:
        print('Your password is fantastic')
def PasswordStrengthNaive(password):
    total_possible_characters = (26 + 26 + 10 + 33) 
    total_possible_passwords = total_possible_characters ** len(password)
    return total_possible_passwords

def PasswordStrengthSimple(password, num_lowercase, num_capital, num_numbers, num_special):
    total_possible_characters = 0
    if num_lowercase is not 0:
        total_possible_characters += 26
    if num_capital is not 0:
        total_possible_characters += 26
    if num_numbers is not 0:
        total_possible_characters += 10
    if num_special is not 0:
        total_possible_characters += 33
    total_possible_passwords = total_possible_characters ** len(password)
    return total_possible_passwords

def Proportions(password, num_lowercase, num_capital, num_numbers, num_special):
    proportion_lowercase = num_lowercase / len(password) * 100
    proportion_capital = num_capital / len(password) * 100
    proportion_numbers = num_numbers / len(password) * 100
    proportion_special = num_special / len(password) * 100

    total_possible_characters = (26 + 26 + 10 + 33) 
    desired_proportion_lowercase = 26 / total_possible_characters * 100
    desired_proportion_capital = 26 / total_possible_characters * 100
    desired_proportion_numbers = 10 / total_possible_characters * 100
    desired_proportion_special = 33 / total_possible_characters * 100

    print('The following statements are assuming that there are 33 special characters allowed for the password')
    print('In order to have a secure password, an even distribution of each character type relative to the number of characters in that category is ideal')
    print('You have {0:.2f}% lowercase letters compared to the ideal {1:.2f}%'.format(proportion_lowercase, desired_proportion_lowercase))
    print('You have {0:.2f}% capital letters compared to the ideal {1:.2f}%'.format(proportion_capital, desired_proportion_capital))
    print('You have {0:.2f}% numbers compared to the ideal {1:.2f}%'.format(proportion_numbers, desired_proportion_numbers))
    print('You have {0:.2f}% special characters compared to the ideal {1:.2f}%'.format(proportion_special, desired_proportion_special))

def PasswordStrengthDictionary(password):
    count = 0
    passwordfile = open('passlist.txt', 'r')
    for word in passwordfile:
        count += 1
        if word.strip() == password:
            print('Dictionary password match. Entry', count)
            return 0
    print('This password is not in the most common 1 million passwords')
    return 1

def RepeatingCharacters(password):
    repeatingList = []
    currentStreak = 1
    for i in range(1, len(password)):
        if password[i - 1] == password[i]:
            currentStreak += 1
        else:
            if(1 < currentStreak):
                repeatingList.append(currentStreak)
            currentStreak = 1
    if(1 < currentStreak):
        repeatingList.append(currentStreak)
    return sum(repeatingList)

def NumberSymbolPlacement(password):
    firstLetter = -1
    lastLetter = -1
    count = 0
    for i in range(0, len(password)):
        c = password[i]
        if c.islower() or c.isupper():
            if(firstLetter == -1):
                firstLetter = i
            lastLetter = i
    if 0 <= firstLetter:
        for i in range(firstLetter, lastLetter):
            c = password[i]
            if not (c.islower() or c.isupper()):
                count += 1
    return count


#PasswordStrength('badpass')
#PasswordStrength('betterP@ss')
#PasswordStrength('G0odP4$Sw0rD')
#PasswordStrength('ev3nBEt3rP4$Sw0rD')
#PasswordStrength('T#E V3ry BE$t3rP4$Sw0rD 0f 4Ll')

#PasswordStrength('midddle9')
#PasswordStrength('mid9dl9e')

PasswordStrength(str(sys.argv[1]))
