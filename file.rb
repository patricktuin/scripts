#Get the input parameter to search for
puts "Search for?"
input = gets.chomp

#Check if matches should be displayed or only count should be done
puts "Display for search results? Y/N/U (Yes / No / Unique values only)"
display = gets.chomp
display = display.downcase

#create an array where search results will be added
array = Array.new

#Open the file
file = File.new("sso10.txt", "r")

linecount = 0
#Go through the whole file
while (line = file.gets)
linecount += 1
#Devide current line into substrings
	substrings = line.split("&")

#For every line check for "input" present. If present return substring where "input" is present
	substrings.each do |sub|
	  if sub.include? input
	    array.push sub
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

#Show the totals
puts ""
puts "Total lines in input file: #{linecount}"
puts "Total search count: #{array.count}"
puts "Unique search count: #{array.uniq.count}"
puts "Duplicate search count: #{array.count - array.uniq.count}"
puts ""

#Close the file
file.close