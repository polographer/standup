module ApplicationHelper
	def bootstrap_menu_entry(title, path)
		active = ""
		active = "class='active' " if (path == request.path)
		"<li " + active + ">" + link_to(title, path) + "</li>"
	end
	
end
