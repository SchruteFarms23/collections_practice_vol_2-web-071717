require 'pry'

def begins_with_r(array)
	new_arr = []
	array.each do |word|
		new_arr << word if word[0] == "r"
	end
	
	new_arr.length == array.length
	
end

def contain_a(array)
	array.select{|word| word.include?("a")}
end

def first_wa(array)
	array.find{|word| word[0..1] == "wa"}
end

def remove_non_strings(array)
	array.delete_if{|obj| obj.class != String}
end




def count_elements(array)
	new_arr = array.uniq
	new_arr.each do |k|
		k[:count] = array.count(k)
	end
end



def merge_data(keys,data)
	keys.collect do |key|
		key.merge(data[0][key[:first_name]])
	end

end





def find_cool(hash)
	hash.select{|k,v| k[:temperature] == "cool" }
end


# schools is given to us like this:
#  {"flatiron school bk"=>{:location=>"NYC"},
#  "flatiron school"=>{:location=>"NYC"},
#  "dev boot camp"=>{:location=>"SF"},
#  "dev boot camp chicago"=>{:location=>"Chicago"},
#  "general assembly"=>{:location=>"NYC"},
#  "Hack Reactor"=>{:location=>"SF"}}

#   we should return this:
#   {"NYC"=>["flatiron school bk", "flatiron school", "general assembly"], "SF"=>["dev boot camp", "Hack Reactor"], "Chicago"=>["dev boot camp chicago"]}


def organize_schools(schools)
	cities = {}

	schools.each do |school,location| #iterate through first level
		location.each do |loc,city| #iterate through second level to reach city
			if cities[city] == nil # checks to see if a new value has been made for that city with any schools
			cities[city]=[school] #for the first school that works it creates an array for the city with that school
		else
			cities[city].push(school) #this is for subsequent schools. It works for every school after the initial one was put in above.
		end
	end
end
	cities
end