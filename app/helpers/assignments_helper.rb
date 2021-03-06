module AssignmentsHelper
	def percent_format(i)
		i.to_s + "%"
	end

	def assn_type_format(i)
		case i
		when 1
			"Extra Credit"
		when 2
			"Homework"
		when 3
			"Major Homework"
		when 4
			"Project"
		when 5
			"Exam"
		else
			"Invalid Type"
		end
	end

	def date_format(i)
		to_add = ""
		case ((i - Time.now.to_date).to_i)
		when 0
			to_add = "due today"
		when -30..0
			to_add = "past due"
		when 30..365
			to_add = "in ~" + ((i - Time.now.to_date).to_i/30).to_s + " months"
		when 365..10000
			to_add = "in over a year"
		else
			to_add = "in " + (i - Time.now.to_date).to_i.to_s + " days"
		end
		i.strftime("%m/%d/%Y") + "\n(" + to_add + ")"
	end

	def days_til_format(i)
		case(i)
		when 0
			to_add = "TODAY!"
		when 1..7
			to_add = "#{i} days"
		end
	end

	def carousel_disabler_link
		if session[:carousel]
			link_to "Disable Carousel", controller: 'assignments', action: 'carousel_toggle'
		else
			link_to "Enable Carousel", controller: 'assignments', action: 'carousel_toggle'
		end
	end

	def show_carousel?
    	session[:carousel]
  	end

  	def greeting_generator(name)
  		case rand(5)
  		when 0
  			"Hey there, #{name}!"
  		when 1
  			"How's it going, #{name}?"
  		when 2
  			"Great to see you, #{name}!"
  		when 3
  			"How've you been, #{name}?"
  		when 4
  			"Ready to get workin', #{name}?"
  		end
  	end
end
