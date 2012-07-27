module ProjectsHelper
	def active?(project)
		if Project.find(project.id).active
			link_to "Disable", '#', class: "btn"
		else
			link_to "Enable", '#', class: "btn"
		end
	end
end



