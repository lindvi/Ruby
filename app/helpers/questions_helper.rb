module QuestionsHelper
  	def add_to_roq(question_id, option_id)
  		#if Roq.find_by_question_id_and_option_id(question_id, option_id).nil?
  		if Roq.where("question_id = ? AND option_id = ?", question_id, option_id)
  			link_to "Add", roqs_path(question_id: question_id, option_id: option_id), :method => :post, class:"btn btn-small btn-success"
  		end
	end
end
