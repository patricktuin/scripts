#################################
# Search through (log)files     #
# Version 0.12                  #
# Last change date: 19-3-2014   #
#################################
#!/usr/bin/env ruby

#Get the input parameter to search for
#puts "Search for?"
#input = gets.chomp
input = "iioi58pt"

#Check if matches should be displayed or only count should be done
#puts "Display for search results? Y/N/U (Yes / No / Unique values only)"
#display = gets.chomp
display = "n"
display = display.downcase

#create an array where search results will be added
array = Array.new

#Open the file
file = File.new("sso12.txt", "r")


linecount=0
while (line = file.gets)
	linecount += 1
	if username = /(username=[^&]*)/.match(line)
		array.push username
	else
	end
end

string = ""
array.each do |usernames|
	string = string + usernames.to_s + " "
end

strings = string.split(" ")

test =Array.new

frequencies = Hash.new(0)
strings.each { |word| frequencies[word] += 1 }
frequencies = frequencies.sort_by {|a, b| b }
#frequencies.reverse!
frequencies.each { |word, frequency| test.push [word] + [frequency.to_s]}


puts test.map {|row| row[1]}

#puts array
#puts linecount
#puts array.count

=begin
linecount = 0
#Go through the whole file
while (line = file.gets)
linecount += 1

#Devide current line into substrings
substrings = line.split("&")
    
#Regular expression for every line
username = /(username=[^&]*)/.match(line)
time = /(timestamp=[0-9]*)/.match(line)
#u=username.split("=")

#For every line check for "input" present. If present return substring where "input" is present
	substrings.each do |sub|
	  if sub.include? input
         #Split the substring. This will retrieve username only
         #subusername = username.split("=")      
	    array.push [[username],[time]]
	    #puts line          
	  else
	 end
	end
end

#check what to display on basis of userinput in variable "display"
result = case display
	when "y"
		puts array
	when "u"
		puts array.uniq
	else
end

test = Array.new

array.each do |x|
	test.push x
end

puts test

#Show the totals
puts ""
puts "Total lines in input file: #{linecount}"
puts "Total search count: #{test.count}"
puts "Unique search count: #{test.uniq.count}"
puts "Duplicate search count: #{array.count - array.uniq.count}"
puts ""
=end

#Close the file
file.close
