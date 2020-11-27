# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
#
# will be using web scraping probably eventually? but for now just this to show how password bank will work

require 'json'
require 'mechanize'

#CommonPassword.create(password:'123456', rank:1)
#CommonPassword.create(password:'password', rank:2)

agent = Mechanize.new
html_loc = File.dirname(__FILE__)
html_loc = html_loc + "/../Cache"
page = agent.get("file:///#{html_loc}/Most common passwords of 2020.html")
temp = page.search("//div[@id='___gatsby']").children.children.search("//div[@dir='ltr']").search("//main[@class='overflow-hidden cyber-month-offset--grey']").children.children.children
#table = temp[1]  # gives div above the one I want
temp2 = temp[2].children.children[0]
table = temp2.children
first = true
table.children.each do |child|
  if !first
    data = child.children.children.children
    count = 0
    password = ""
    exposed =""
    data.children.each do |lowestLevel|
      lowest = lowestLevel.to_s
      if lowest.index("span").nil?
        if count == 0
          password = lowest
        elsif count == 3
          exposed = lowest.delete ","
          exposed = exposed.to_i
        end
        count = count + 1
      end
      if count == 4
        break
      end
    end
    puts password
    puts exposed
    #CommonPassword.create(password:password, rank:exposed)

  else
    first = false
  end

end

