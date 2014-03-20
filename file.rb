#################################
# Search through (log)files     #
# Version 0.12                  #
# Last change date: 19-3-2014   #
#################################
#!/usr/bin/env ruby

#Get the input parameter to search for
#puts "Search for?"
#input = gets.chomp
input = "red"

#Check if matches should be displayed or only count should be done
#puts "Display for search results? Y/N/U (Yes / No / Unique values only)"
#display = gets.chomp
display = "n"
display = display.downcase

#method to search through a logfile. input a username, output timestamp & matching username
def search(input)
	#create an array where search results will be added
	search_output = Array.new

	#Open the file
	file = File.new("test.txt", "r")

	linecount=0
	while (line = file.gets)
		linecount += 1

		if line.include? input
			username = /(username=[^&]*)/.match(line)
			time = /(timestamp=[0-9]*)/.match(line)
			search_output.push [[username], [time]]       
	  	else
	 	end
	end

	#Print results (if found) otherwise print no match
	if search_output.count == 0
		search_output = "No match found"
	else
	end

	#Close the file
	file.close

	return search_output 
end

def search_results(input)

	words = input.split(" ")
	frequencies = Hash.new(0)
	words.each { |word| frequencies[word] += 1 }
	frequencies.each { |word, frequency| puts word + " " + frequency.to_s }

end



puts search_results("pol lop pol lop pol")

=begin

	

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