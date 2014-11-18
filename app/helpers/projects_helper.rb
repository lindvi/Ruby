module ProjectsHelper

	def add_to_rpq(project_id, question_id)
  		#if Rpq.find_by_project_id_and_question_id(project_id, question_id).nil?
		if Rpq.where("project_id = ? AND question_id =?", project_id, question_id).nil?
  			link_to "Add", rpqs_path(project_id: project_id, question_id: question_id), :method => :post, class:"btn btn-small btn-success"
  		end
  	end
end



